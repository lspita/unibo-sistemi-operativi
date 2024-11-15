/* Author: Stefano Ferretti
 * Questo codice non è stato testato adeguatamente. Vi prego di segnalare 
 * eventuali problemi o bug riscontrati
 * 
*/

#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>

#define NUM_THREADS 4
#define NUM_INCREMENTS 1000000

volatile long long shared_variable = 0;

void* increment_function(void* arg) {
    int thread_id = *(int*)arg;
    int local_increments = 0;

    for (int i = 0; i < NUM_INCREMENTS; i++) {
        shared_variable++;  // Operazione non atomica
        local_increments++;

        // Introduciamo un ritardo casuale per aumentare la probabilità di race condition
        if (i % 100 == 0) {
            usleep(rand() % 5);
        }
    }

    printf("Thread %d ha eseguito %d incrementi\n", thread_id, local_increments);
    return NULL;
}

int main() {
    pthread_t threads[NUM_THREADS];
    int thread_ids[NUM_THREADS];
    
    srand(time(NULL));  // Inizializza il generatore di numeri casuali

    printf("Valore iniziale della variabile condivisa: %lld\n", shared_variable);

    // Crea i thread
    for (int i = 0; i < NUM_THREADS; i++) {
        thread_ids[i] = i;
        if (pthread_create(&threads[i], NULL, increment_function, &thread_ids[i]) != 0) {
            fprintf(stderr, "Errore nella creazione del thread %d\n", i);
            return 1;
        }
    }

    // Attendi che tutti i thread terminino
    for (int i = 0; i < NUM_THREADS; i++) {
        if (pthread_join(threads[i], NULL) != 0) {
            fprintf(stderr, "Errore nell'attesa del thread %d\n", i);
            return 1;
        }
    }

    printf("Valore finale della variabile condivisa: %lld\n", shared_variable);
    printf("Valore atteso: %lld\n", (long long)NUM_THREADS * NUM_INCREMENTS);

    return 0;
}