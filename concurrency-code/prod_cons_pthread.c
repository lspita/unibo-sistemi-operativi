/* Author: Stefano Ferretti
 * Questo codice non è stato testato adeguatamente. Vi prego di segnalare 
 * eventuali problemi o bug riscontrati
 * 
Questo codice implementa un semplice esempio di produttore-consumatore utilizzando thread in C. 
Il produttore genera elementi e li inserisce in un buffer condiviso, mentre il consumatore 
preleva gli elementi dal buffer. Il buffer ha una dimensione massima definita da BUFFER_SIZE. 
Vengono utilizzati mutex e variabili condizionali per sincronizzare l’accesso al buffer e 
garantire che il produttore attenda quando il buffer è pieno e il consumatore attenda quando 
il buffer è vuoto. 
*/

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h> // Per la funzione sleep

#define BUFFER_SIZE 10

int buffer[BUFFER_SIZE];
int count = 0;

/* 
PTHREAD_MUTEX_INITIALIZER: 
È un macro che inizializza staticamente un mutex con attributi predefiniti
Può essere usato solo per l'inizializzazione statica (a tempo di compilazione)
Il mutex viene creato con attributi predefiniti (non-ricorsivo, non-condiviso tra processi) 

PTHREAD_COND_INITIALIZER:
È un macro per inizializzare staticamente una variabile condizione
Come per i mutex, può essere usato solo per inizializzazione statica
La variabile condizione viene creata con attributi predefiniti
*/
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond_producer = PTHREAD_COND_INITIALIZER;
pthread_cond_t cond_consumer = PTHREAD_COND_INITIALIZER;

// Funzione del produttore
void* producer(void* arg) {
    for (int i = 0; i < 20; i++) {
        pthread_mutex_lock(&mutex);

        // Attende se il buffer è pieno
        while (count == BUFFER_SIZE) {
            pthread_cond_wait(&cond_producer, &mutex);
        }

        // Produce un elemento e lo aggiunge al buffer
        buffer[count++] = i;
        printf("Produced: %d\n", i);

        // Segnala al consumatore che un nuovo elemento è disponibile
        pthread_cond_signal(&cond_consumer);
        pthread_mutex_unlock(&mutex);

        // Aggiunge un piccolo delay
        // sleep(0.0001);
    }
    return NULL;
}

// Funzione del consumatore
void* consumer(void* arg) {
    for (int i = 0; i < 20; i++) {
        pthread_mutex_lock(&mutex);

        // Attende se il buffer è vuoto
        while (count == 0) {
            pthread_cond_wait(&cond_consumer, &mutex);
        }

        // Consuma un elemento dal buffer
        int item = buffer[--count];
        printf("Consumed: %d\n", item);

        // Segnala al produttore che c'è spazio disponibile
        pthread_cond_signal(&cond_producer);
        pthread_mutex_unlock(&mutex);

        // Aggiunge un piccolo delay
        // sleep(0.0001);
    }
    return NULL;
}

int main() {
    pthread_t producer_thread, consumer_thread;

    // Crea i thread del produttore e del consumatore
    pthread_create(&producer_thread, NULL, producer, NULL);
    pthread_create(&consumer_thread, NULL, consumer, NULL);

    // Attende che i thread terminino
    pthread_join(producer_thread, NULL);
    pthread_join(consumer_thread, NULL);

    return 0;
}
