#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h> // Aggiunto per la dichiarazione di wait()

#define BUFFER_SIZE 100

int main() {
    int pipefd[2];  // Array per i descrittori della pipe
    pid_t pid;
    char buffer[BUFFER_SIZE];

    // Crea la pipe
    // La funzione pipe() crea una pipe unidirezionale, un canale di comunicazione
    // che può essere utilizzato per il passaggio di dati tra processi.
    // 
    // Sintassi: int pipe(int pipefd[2]);
    // 
    // pipefd[0] sarà l'estremità di lettura della pipe
    // pipefd[1] sarà l'estremità di scrittura della pipe
    // 
    // Restituisce 0 in caso di successo, -1 in caso di errore
    if (pipe(pipefd) == -1) {
        perror("pipe");
        exit(1);
    }

    // Crea un nuovo processo
    // fork() restituisce 0 nel processo figlio e il PID del figlio nel processo genitore
    pid = fork();

    if (pid == -1) {
        perror("fork");
        exit(1);
    } else if (pid == 0) {  // Codice eseguito dal processo figlio
        close(pipefd[1]);  // Chiude l'estremità di scrittura non necessaria nel figlio

        // Legge dalla pipe
        // read() bloccherà l'esecuzione finché non ci sono dati da leggere
        read(pipefd[0], buffer, BUFFER_SIZE);
        printf("Processo figlio ha ricevuto: %s\n", buffer);

        close(pipefd[0]);  // Chiude l'estremità di lettura dopo l'uso
        exit(0);
    } else {  // Codice eseguito dal processo genitore
        close(pipefd[0]);  // Chiude l'estremità di lettura non necessaria nel genitore

        // Prepara il messaggio da inviare
        strcpy(buffer, "Ciao dal processo genitore!");
        
        // Scrive nella pipe
        // write() scriverà i dati nella pipe
        write(pipefd[1], buffer, strlen(buffer) + 1);

        close(pipefd[1]);  // Chiude l'estremità di scrittura dopo l'uso
        
        int status;
        waitpid(pid, &status, 0);  // Aspetta che il processo figlio specifico termini
        exit(0);
    }

    return 0;
}
