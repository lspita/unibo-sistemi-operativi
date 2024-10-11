/* Author: Stefano Ferretti
 * Questo codice non è stato testato adeguatamente. Vi prego di segnalare 
 * eventuali problemi o bug riscontrati
 * 
 * compila con gcc -o process-descriptor-info process-descriptor-info.c -lproc
 */

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
//#include <libproc.h>
//#include <sys/proc.h>


#define PROC_NAME_LEN 1024
#define MAX_PATH 1024

/*
NOTE SUL CODICE

*****
pid_t
*****
pid_t è un tipo di dato utilizzato nei sistemi operativi Unix per rappresentare gli identificatori di processo (PID).

È definito nell'header <sys/types.h>.
pid_t è un alias per un tipo intero con segno, spesso int o long int. La dimensione esatta può variare a seconda del sistema.

Range di valori:
- Valori positivi: Rappresentano PID validi.
- 0: Ha un significato speciale in alcune chiamate di sistema, spesso riferendosi al processo chiamante.
- Valori negativi: Possono essere usati per indicare errori in alcune funzioni di sistema.

È usato in molte chiamate di sistema e funzioni relative ai processi, come fork(), wait(), kill(), ecc.

Portabilità: L'uso di pid_t invece di un tipo intero diretto aumenta la portabilità del codice, poiché astrae la rappresentazione specifica del sistema per gli ID di processo.

*****
/proc
*****
/proc è un filesystem virtuale molto importante nei sistemi Unix-like, in particolare in Linux. Esso fornisce un'interfaccia per accedere alle informazioni del kernel riguardanti i processi e altre informazioni di sistema

Struttura di /proc:
- Ogni processo ha una directory numerata corrispondente al suo PID (es. /proc/1234).
- Ci sono anche file e directory speciali che forniscono informazioni di sistema

Sono un modo efficiente e standard per ottenere informazioni sui processi in sistemi Linux.
Non richiedono permessi speciali per leggere informazioni sul proprio processo.
Forniscono dati in tempo reale direttamente dal kernel.

File che leggiamo nel nostro codice:
a) /proc/[pid]/comm:
Contiene il nome del comando del processo (limitato a 15 caratteri).
È una versione più corta e semplice del nome del processo rispetto a /proc/[pid]/cmdline.

b) /proc/[pid]/status:
Fornisce molte informazioni sul processo in un formato leggibile dall'uomo.
Include lo stato del processo, PID, PPID, UID, GID, utilizzo della memoria, e altro.
Nel nostro codice, estraiamo specificamente la linea "State:" da questo file.

c) /proc/[pid]/stat:
Contiene informazioni sullo stato del processo in un formato più compatto, pensato per essere letto da programmi.
I campi sono separati da spazi e includono PID, nome del processo, stato, PPID, e molte altre informazioni.
Nel nostro codice, usiamo questo file per estrarre la priorità del processo.


Informazioni specifiche che estraiamo:
- Dal file comm: Il nome del processo.
- Dal file status: Lo stato del processo (es. Running, Sleeping, Zombie, etc.).
- Dal file stat: La priorità del processo.

Considerazioni:
Le informazioni in /proc sono dinamiche e possono cambiare rapidamente.
L'accesso a /proc è specifico del sistema operativo, quindi questo codice funzionerà su Linux ma potrebbe non funzionare su altri sistemi Unix-like senza modifiche.


*****
read()
*****
Funzione read():
read() è una chiamata di sistema Unix e una funzione POSIX utilizzata per leggere dati da un file descriptor. La sua firma è:
ssize_t read(int fd, void *buf, size_t count);

fd: Il file descriptor da cui leggere.
buf: Il buffer in cui memorizzare i dati letti.
count: Il numero massimo di byte da leggere.

Restituisce il numero di byte effettivamente letti, che può essere minore di count.
Restituisce 0 se raggiunge la fine del file.
Restituisce -1 in caso di errore, impostando errno

*/


/*
Questa funzione definisce una funzione print_process_info che accetta un PID come argomento.
Legge varie informazioni dal filesystem /proc.
Stampa il PID, il nome del processo, lo stato e la priorità.
*/
void print_process_info(pid_t pid) {
    char path[MAX_PATH];
    char buffer[1024];
    int fd;

    // Stampa PID
    printf("PID: %d\n", pid);


    // Stampa nome del processo
    /*
      snprintf() è una versione più sicura di sprintf().
      La 'n' in snprintf sta per "n caratteri", il che significa che
      questa funzione accetta un parametro che specifica la dimensione
      massima del buffer di destinazione. Così si evita buffer overflow

      - path: buffer di destinazione
      - sizeof(path): dimensione massima del buffer
      - "/proc/%d/comm": è la stringa di formato
      - pid:  valore da inserire nella stringa formattata
     */
    snprintf(path, sizeof(path), "/proc/%d/comm", pid);
    fd = open(path, O_RDONLY);
    if (fd != -1) {
        ssize_t len = read(fd, buffer, sizeof(buffer) - 1);
        if (len > 0) {
	    /* '\0' equivale a null
	       I file in /proc non terminano necessariamente con null.
	       Le funzioni C per la manipolazione delle stringhe
	       si aspettano un '\0'. Quindi lo impostiamo manualmente.
	    */
            buffer[len] = '\0';
            printf("Nome del processo: %s", buffer);
        }
        close(fd);
    }

    // Stampa stato del processo
    snprintf(path, sizeof(path), "/proc/%d/status", pid);
    fd = open(path, O_RDONLY);
    if (fd != -1) {
        ssize_t len = read(fd, buffer, sizeof(buffer) - 1);
        if (len > 0) {
            buffer[len] = '\0';
	    /* strstr() cerca la prima occorrenza di una sottostringa
	       all'interno di una stringa più lunga.
	       Restituisce un puntatore alla prima occorrenza
	    */
            char *state = strstr(buffer, "State:");
            if (state) {
	        /* cerca il primo carattere di nuova riga ('\n') nella
		   stringa state e salvo su end */
                char *end = strchr(state, '\n');
		// aggiungo carattere null (\0) finale
                if (end) *end = '\0';
                printf("%s\n", state);
            }
        }
        close(fd);
    }

    // Stampa priorità
    snprintf(path, sizeof(path), "/proc/%d/stat", pid);
    fd = open(path, O_RDONLY);
    if (fd != -1) {
        ssize_t len = read(fd, buffer, sizeof(buffer) - 1);
        if (len > 0) {
            buffer[len] = '\0';
            int priority;
            sscanf(buffer, "%*d %*s %*c %*d %*d %*d %*d %*d %*u %*u %*u %*u %*u %*u %*u %*u %*u %*d %*d %*d %*d %*u %*u %*d %*u %*u %*u %*u %*u %*u %*u %*u %*u %*u %*u %*u %*u %*d %d", &priority);
            printf("Priorità: %d\n", priority);
        }
        close(fd);
    }
}


// ///////////////
// // versione adattata per mac
// void print_process_info_mac(pid_t pid) {
//     char name[PROC_PIDPATHINFO_MAXSIZE];
//     struct proc_bsdinfo proc_info;

//     // Stampa PID
//     printf("PID: %d\n", pid);

//     // Stampa nome del processo
//     /* 
//      * Su macOS, usiamo proc_name() invece di leggere da /proc/<pid>/comm
//      * Questa funzione ottiene il nome del processo dato il suo PID
//      */
//     if (proc_name(pid, name, sizeof(name)) > 0) {
//         printf("Nome del processo: %s\n", name);
//     } else {
//         printf("Impossibile ottenere il nome del processo\n");
//     }

//     // Stampa stato del processo
//     /*
//      * Su macOS, usiamo proc_pidinfo() invece di leggere da /proc/<pid>/status
//      * Questa funzione ottiene varie informazioni sul processo, incluso il suo stato
//      * PROC_PIDTBSDINFO è il tipo di informazione che richiediamo (informazioni di base sul processo)
//      */
//     if (proc_pidinfo(pid, PROC_PIDTBSDINFO, 0, &proc_info, sizeof(proc_info)) > 0) {
//         printf("Stato: ");
//         /*
//          * Lo stato del processo su macOS è rappresentato da costanti come SRUN, SSLEEP, etc.
//          * Usiamo uno switch per tradurre questi stati in stringhe leggibili
//          */
//         switch (proc_info.pbi_status) {
//             case SIDL:    printf("IDLE\n"); break;
//             case SRUN:    printf("RUNNING\n"); break;
//             case SSLEEP:  printf("SLEEPING\n"); break;
//             case SSTOP:   printf("STOPPED\n"); break;
//             case SZOMB:   printf("ZOMBIE\n"); break;
//             default:      printf("UNKNOWN\n"); break;
//         }
//     } else {
//         printf("Impossibile ottenere lo stato del processo\n");
//     }
// }


// ottiene il PID del processo corrente e chiama print_process_info
int main() {
    pid_t pid = getpid();
    // da eseguire su linux
    print_process_info(pid);
    // da eseguire su mac
    // print_process_info_mac(pid);
    // su windows ... 
    return 0;
}
