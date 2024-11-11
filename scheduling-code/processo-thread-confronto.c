/* Author: Stefano Ferretti
 * Questo codice non è stato testato adeguatamente. Vi prego di segnalare 
 * eventuali problemi o bug riscontrati
 * 
 * Programma di confronto tra processi e thread
 * 
 * Questo programma è progettato per dimostrare e confrontare le prestazioni
 * di creazione e esecuzione di processi e thread in un sistema operativo.
 * 
 * Funzionamento generale:
 * 1. Il programma esegue un'operazione semplice (somma di due numeri) molte volte,
 *    prima utilizzando un processo figlio, poi utilizzando un thread.
 * 
 * 2. Per ogni metodo (processo e thread), il programma:
 *    a) Misura il tempo di inizio
 *    b) Crea un processo figlio o un thread
 *    c) Esegue l'operazione di somma un numero predefinito di volte
 *    d) Misura il tempo di fine
 *    e) Calcola e stampa il tempo totale impiegato
 * 
 * 3. Confrontando i tempi di esecuzione, gli studenti possono osservare
 *    le differenze di prestazioni tra l'utilizzo di processi e thread
 *    per eseguire lo stesso compito.
 * 
 * Questo esperimento aiuta a comprendere:
 * - I costi di creazione e gestione di processi e thread
 * - Le differenze di prestazioni tra processi e thread
 * - L'uso pratico di chiamate di sistema per la gestione di processi e thread
 * - Tecniche di misurazione del tempo in programmi C
 * 
 * Il programma utilizza le librerie POSIX per la creazione di processi (fork)
 * e thread (pthread), dimostrando l'uso pratico di queste API fondamentali
 * nei sistemi operativi moderni.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <pthread.h>
#include <sys/time.h>

// Numero di volte che eseguiremo l'operazione di somma
#define NUM_OPERAZIONI 10000

/*
 * struct timeval è definita in <sys/time.h> e viene utilizzata per rappresentare un timestamp preciso.
 * È composta da due campi:
 * - tv_sec: rappresenta i secondi
 * - tv_usec: rappresenta i microsecondi (1 secondo = 1,000,000 microsecondi)
 *
 * Questa struttura offre una precisione al microsecondo, molto utile per misurare
 * intervalli di tempo brevi come nel nostro caso.
 *
 * La funzione gettimeofday() viene utilizzata per ottenere il tempo corrente
 * e memorizzarlo in una struct timeval.
 */

// Struttura per passare gli argomenti alla funzione del thread
struct Argomenti {
    int a;
    int b;
};

// Funzione per calcolare e stampare il tempo trascorso
void calcola_tempo(struct timeval inizio, struct timeval fine, char* nome) {
    long secondi = fine.tv_sec - inizio.tv_sec;
    long microsecondi = fine.tv_usec - inizio.tv_usec;
    double tempo_totale = secondi + microsecondi/1000000.0;
    printf("%s: %f secondi\n", nome, tempo_totale);
}

// Funzione che esegue la somma di due numeri
int somma(int a, int b) {
    return a + b;
}

// Funzione che verrà eseguita dal thread
void* thread_function(void* arg) {
    /*
     * Spiegazione dettagliata della riga: struct Argomenti* args = (struct Argomenti*)arg;
     *
     * 1. Questa riga esegue un cast di tipo (type cast) da void* a struct Argomenti*.
     * 
     * 2. Le funzioni thread in C (usando la libreria POSIX threads) devono avere una firma
     *    del tipo void* function(void* arg). Questo permette loro di accettare qualsiasi tipo di argomento.
     * 
     * 3. Quando abbiamo creato il thread, abbiamo passato un puntatore alla nostra struct Argomenti:
     *    pthread_create(&thread, NULL, thread_function, &args);
     * 
     * 4. All'interno di thread_function, riceviamo questo puntatore come void*. 
     *    Per usarlo, dobbiamo riconvertirlo al tipo originale.
     * 
     * 5. Il cast dice al compilatore: "Fidati, questo void* sta effettivamente puntando a una struct Argomenti".
     * 
     * 6. Dopo il cast, possiamo usare args->a e args->b per accedere ai membri della struttura.
     * 
     * Questa tecnica ci permette di passare multipli argomenti a una funzione thread 
     * impacchettandoli in una struttura, nonostante la funzione thread possa accettare 
     * solo un singolo parametro void*.
     * 
     * È importante notare che questo approccio richiede una programmazione attenta per garantire 
     * la sicurezza dei tipi. Se si passa un puntatore di tipo diverso quando si crea il thread, 
     * e poi lo si converte in struct Argomenti* nella funzione thread, potrebbe portare a un 
     * comportamento indefinito del programma.
     */
    struct Argomenti* args = (struct Argomenti*)arg;
    for (int i = 0; i < NUM_OPERAZIONI; i++) {
        somma(args->a, args->b);
    }
    return NULL;
}

int main() {
    struct timeval inizio, fine;
    int status;
    struct Argomenti args = {5, 10};

    // Test con processi
    printf("Iniziamo il test con i processi...\n");
    gettimeofday(&inizio, NULL);
    pid_t pid = fork();
    if (pid == 0) {
        // Codice del processo figlio
        for (int i = 0; i < NUM_OPERAZIONI; i++) {
            somma(args.a, args.b);
        }
        exit(0);
    } else {
        // Codice del processo padre
        wait(&status);  // Aspetta che il figlio termini
    }
    gettimeofday(&fine, NULL);
    calcola_tempo(inizio, fine, "Processo");

    // Test con thread
    printf("Iniziamo il test con i thread...\n");
    pthread_t thread;
    gettimeofday(&inizio, NULL);
    pthread_create(&thread, NULL, thread_function, &args);
    pthread_join(thread, NULL);  // Aspetta che il thread termini
    gettimeofday(&fine, NULL);
    calcola_tempo(inizio, fine, "Thread");

    return 0;
}
