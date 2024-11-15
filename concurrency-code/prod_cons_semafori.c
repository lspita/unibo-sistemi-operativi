/* Author: Stefano Ferretti
 * Questo codice non è stato testato adeguatamente. Vi prego di segnalare 
 * eventuali problemi o bug riscontrati
 * 
 * Programma C che implementa il problema del produttore-consumatore
 * utilizzando i semafori POSIX.
 *
 * Il produttore genera dati e li inserisce in un buffer condiviso.
 * Il consumatore preleva i dati dal buffer e li elabora.
 * I semafori vengono utilizzati per sincronizzare l'accesso al buffer
 * e garantire che il produttore e il consumatore non accedano contemporaneamente
 * alle stesse risorse.
 * 
 * ATTENZIONE: su mac alcune funzioni sono deprecate
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

#define BUFFER_SIZE 10

int buffer[BUFFER_SIZE];
int count = 0; // Contatore degli elementi nel buffer

sem_t empty; // Semaforo che tiene traccia degli spazi vuoti nel buffer
sem_t full;  // Semaforo che tiene traccia degli spazi pieni nel buffer
pthread_mutex_t mutex; // Mutex per proteggere l'accesso al buffer

void* producer(void* arg) {
    int item;
    while (1) {
        item = rand() % 100; // Genera un dato casuale
        sem_wait(&empty); // Decrementa il semaforo empty
        pthread_mutex_lock(&mutex); // Acquisisce il mutex

        // Inserisce l'elemento nel buffer
        buffer[count] = item;
        count++;
        printf("Produttore ha prodotto: %d\n", item);

        pthread_mutex_unlock(&mutex); // Rilascia il mutex
        sem_post(&full); // Incrementa il semaforo full

        // sleep(1); // Simula il tempo di produzione
    }
}

void* consumer(void* arg) {
    int item;
    while (1) {
        sem_wait(&full); // Decrementa il semaforo full
        pthread_mutex_lock(&mutex); // Acquisisce il mutex

        // Preleva l'elemento dal buffer
        item = buffer[count - 1];
        count--;
        printf("Consumatore ha consumato: %d\n", item);

        pthread_mutex_unlock(&mutex); // Rilascia il mutex
        sem_post(&empty); // Incrementa il semaforo empty

        sleep(1); // Simula il tempo di consumo
    }
}

int main() {
    pthread_t prod, cons;

    // Inizializza i semafori e il mutex
    sem_init(&empty, 0, BUFFER_SIZE);
    sem_init(&full, 0, 0);
    pthread_mutex_init(&mutex, NULL);

    // Crea i thread del produttore e del consumatore
    pthread_create(&prod, NULL, producer, NULL);
    pthread_create(&cons, NULL, consumer, NULL);

    // Attende la terminazione dei thread (in questo esempio non termineranno mai)
    pthread_join(prod, NULL);
    pthread_join(cons, NULL);

    // Distrugge i semafori e il mutex
    sem_destroy(&empty);
    sem_destroy(&full);
    pthread_mutex_destroy(&mutex);

    return 0;
}
