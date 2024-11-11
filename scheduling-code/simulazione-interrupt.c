/* Author: Stefano Ferretti
 * Questo codice non è stato testato adeguatamente. Vi prego di segnalare 
 * eventuali problemi o bug riscontrati
 */

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

// La keyword volatile è usata per indicare al compilatore che il valore di questa variabile
// può cambiare in qualsiasi momento, anche senza un'assegnazione esplicita nel codice visibile.
// Questo è cruciale quando si lavora con segnali o interrupt, poiché il valore può essere
// modificato dal gestore di segnali in qualsiasi momento.
volatile int in_kernel_mode = 0;

// Funzione di gestione dell'interrupt (segnale SIGINT)
void interrupt_handler(int signum) {
    // Entra in modalità kernel
    in_kernel_mode = 1;
    printf("\nEntrato in modalità kernel\n");
    
    // Simula il lavoro di gestione dell'interrupt
    // In un sistema reale, qui verrebbero eseguite operazioni come il salvataggio
    // dello stato del processo, la gestione dell'interrupt specifico, ecc.
    for (int i = 0; i < 5; i++) {
        printf("K");
        fflush(stdout);  // Forza l'output immediato
        usleep(100000);  // Attende 100ms per simulare il lavoro
    }
    
    // Esce dalla modalità kernel
    printf("\nUscito dalla modalità kernel\n");
    in_kernel_mode = 0;
}

int main() {
    // Imposta il gestore per SIGINT (Ctrl+C)
    // signal() è una funzione che associa una funzione (interrupt_handler)
    // a un segnale specifico (SIGINT in questo caso)
    if (signal(SIGINT, interrupt_handler) == SIG_ERR) {
        perror("Impossibile impostare il gestore di segnali");
        exit(1);
    }
    
    printf("Simulazione iniziata. Premi Ctrl+C per generare un interrupt.\n");
    
    // Ciclo infinito che simula il lavoro del sistema
    // In un sistema reale, questo rappresenterebbe l'esecuzione continua di processi
    while (1) {
        if (in_kernel_mode) {
            // 'K' rappresenta l'esecuzione in modalità kernel
            printf("K");
        } else {
            // 'U' rappresenta l'esecuzione in modalità utente
            printf("U");
        }
        fflush(stdout);  // Forza l'output immediato
        usleep(100000);  // Attende 100ms per rallentare l'output e renderlo leggibile
    }
    
    return 0;  // Questo punto non verrà mai raggiunto a causa del ciclo infinito
}
