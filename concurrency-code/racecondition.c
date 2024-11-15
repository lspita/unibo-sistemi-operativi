/* Author: Stefano Ferretti
 * Questo codice non è stato testato adeguatamente. Vi prego di segnalare 
 * eventuali problemi o bug riscontrati
 */

#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

int shared_variable = 0;

void* modify_function(void* arg) {
    int increment = *(int*)arg;
    for (int i = 0; i < 1000000; ++i) {
        shared_variable += increment;
    }
    return NULL;
}

int main() {
    pthread_t thread1, thread2;
    int increment1 = 1;
    int increment2 = -1;

    // Create two threads, passing different increment values
    pthread_create(&thread1, NULL, modify_function, &increment1);
    pthread_create(&thread2, NULL, modify_function, &increment2);

    // Wait for threads to finish
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    printf("Final value of shared variable: %d\n", shared_variable);

    return 0;
}
