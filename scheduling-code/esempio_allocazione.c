/* Author: Stefano Ferretti
 * Questo codice non è stato testato adeguatamente. Vi prego di segnalare 
 * eventuali problemi o bug riscontrati
 */

#include <stdio.h>
#include <stdlib.h>

void stackExample(int n) {
    int array[n];  // Allocazione nello stack
    printf("Indirizzo dell'array nello stack: %p\n", (void*)array);
}

int main() {
    int stackVar = 5;  // Variabile nello stack
    int *heapVar = (int*)malloc(sizeof(int));  // Allocazione nello heap
    
    if (heapVar == NULL) {
        fprintf(stderr, "Errore nell'allocazione della memoria\n");
        return 1;
    }
    
    *heapVar = 10;
    
    printf("Indirizzo della variabile nello stack: %p\n", (void*)&stackVar);
    printf("Valore della variabile nello stack: %d\n", stackVar);
    printf("Indirizzo della variabile nello heap: %p\n", (void*)heapVar);
    printf("Valore della variabile nello heap: %d\n", *heapVar);
    
    stackExample(5);
    
    free(heapVar);  // Liberare la memoria allocata nello heap
    return 0;
}