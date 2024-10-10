/*
Simulatore politiche di scheduling

Questo programma simula tre diverse politiche di scheduling per un corso di sistemi operativi:
1. First Come First Served (FCFS)
2. Shortest Job First (SJF)
3. Round Robin (RR)

Ogni politica di scheduling viene implementata come una funzione separata. Il programma legge i dati di input per i processi, esegue le simulazioni e stampa i risultati per ciascuna politica di scheduling.

Definizioni metriche:
- Burst time: tempo richiesto per l'esecuzione del processo
- Turnaround time: tempo che intercorre tra l'arrivo e il completamento del processo
- Waiting time: tempo passato in attesa da un processo
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_PROCESSES 10
#define TIME_QUANTUM 2

// Definizione della struttura Process
typedef struct {
    int id;
    int arrival_time;
    int burst_time;
    int remaining_time;
    int completion_time;
    int turnaround_time;
    int waiting_time;
} Process;

// Dichiarazione delle funzioni di scheduling
void fcfs(Process processes[], int n);
void sjf(Process processes[], int n);
void round_robin(Process processes[], int n);
void print_results(Process processes[], int n, const char* algorithm);

int main() {
    Process processes[MAX_PROCESSES];
    int n, i;

    // Lettura del numero di processi
    printf("Inserisci il numero di processi (max %d): ", MAX_PROCESSES);
    scanf("%d", &n);

    // Lettura dei dati di input per ciascun processo
    for (i = 0; i < n; i++) {
        processes[i].id = i + 1;
        printf("Processo %d:\n", i + 1);
        printf("Tempo di arrivo: ");
        scanf("%d", &processes[i].arrival_time);
        printf("Tempo di esecuzione: ");
        scanf("%d", &processes[i].burst_time);
        processes[i].remaining_time = processes[i].burst_time;
    }

    // Creazione di copie dei processi per ciascuna politica di scheduling
    Process fcfs_processes[MAX_PROCESSES];
    Process sjf_processes[MAX_PROCESSES];
    Process rr_processes[MAX_PROCESSES];

    memcpy(fcfs_processes, processes, sizeof(Process) * n);
    memcpy(sjf_processes, processes, sizeof(Process) * n);
    memcpy(rr_processes, processes, sizeof(Process) * n);

    // Esecuzione delle politiche di scheduling
    fcfs(fcfs_processes, n);
    sjf(sjf_processes, n);
    round_robin(rr_processes, n);

    return 0;
}

// Implementazione della politica FCFS
void fcfs(Process processes[], int n) {
    int current_time = 0;
    for (int i = 0; i < n; i++) {
        if (current_time < processes[i].arrival_time) {
            current_time = processes[i].arrival_time;
        }
        processes[i].completion_time = current_time + processes[i].burst_time;
        processes[i].turnaround_time = processes[i].completion_time - processes[i].arrival_time;
        processes[i].waiting_time = processes[i].turnaround_time - processes[i].burst_time;
        current_time = processes[i].completion_time;
    }
    print_results(processes, n, "First Come First Served (FCFS)");
}

// Implementazione della politica SJF
void sjf(Process processes[], int n) {
    int current_time = 0;
    int completed = 0;
    while (completed < n) {
        int shortest_job = -1;
        int shortest_time = 9999;
        for (int i = 0; i < n; i++) {
            if (processes[i].arrival_time <= current_time && processes[i].remaining_time > 0) {
                if (processes[i].remaining_time < shortest_time) {
                    shortest_job = i;
                    shortest_time = processes[i].remaining_time;
                }
            }
        }
        if (shortest_job == -1) {
            current_time++;
        } else {
            processes[shortest_job].remaining_time = 0;
            processes[shortest_job].completion_time = current_time + shortest_time;
            processes[shortest_job].turnaround_time = processes[shortest_job].completion_time - processes[shortest_job].arrival_time;
            processes[shortest_job].waiting_time = processes[shortest_job].turnaround_time - processes[shortest_job].burst_time;
            current_time = processes[shortest_job].completion_time;
            completed++;
        }
    }
    print_results(processes, n, "Shortest Job First (SJF)");
}

// Implementazione della politica Round Robin
void round_robin(Process processes[], int n) {
    int current_time = 0;
    int completed = 0;
    int total_burst_time = 0;

    // Calcola il tempo totale di burst
    for (int i = 0; i < n; i++) {
        total_burst_time += processes[i].burst_time;
        processes[i].remaining_time = processes[i].burst_time;
    }

    while (completed < n) {
        int flag = 0;
        for (int i = 0; i < n; i++) {
            if (processes[i].remaining_time > 0 && processes[i].arrival_time <= current_time) {
                flag = 1;
                
                if (processes[i].remaining_time > TIME_QUANTUM) {
                    current_time += TIME_QUANTUM;
                    processes[i].remaining_time -= TIME_QUANTUM;
                } else {
                    current_time += processes[i].remaining_time;
                    processes[i].completion_time = current_time;
                    processes[i].remaining_time = 0;
                    completed++;

                    processes[i].turnaround_time = processes[i].completion_time - processes[i].arrival_time;
                    processes[i].waiting_time = processes[i].turnaround_time - processes[i].burst_time;
                }
            }
        }

        // Se nessun processo è disponibile, avanza il tempo
        if (flag == 0) {
            current_time++;
        }

        // Controllo di sicurezza per evitare loop infiniti
        if (current_time > total_burst_time * 2) {
            printf("Errore: possibile loop infinito in Round Robin. Uscita forzata.\n");
            break;
        }
    }

    print_results(processes, n, "Round Robin (RR)");
}

// Funzione per stampare i risultati
void print_results(Process processes[], int n, const char* algorithm) {
    printf("\n%s\n", algorithm);
    printf("PID\tArrival\tBurst\tCompletion\tTurnaround\tWaiting\n");
    float avg_turnaround = 0, avg_waiting = 0;
    for (int i = 0; i < n; i++) {
        printf("%d\t%d\t%d\t%d\t\t%d\t\t%d\n", 
               processes[i].id, processes[i].arrival_time, processes[i].burst_time,
               processes[i].completion_time, processes[i].turnaround_time, processes[i].waiting_time);
        avg_turnaround += processes[i].turnaround_time;
        avg_waiting += processes[i].waiting_time;
    }
    avg_turnaround /= n;
    avg_waiting /= n;
    printf("Tempo di turnaround medio: %.2f\n", avg_turnaround);
    printf("Tempo di attesa medio: %.2f\n", avg_waiting);
}
