# Ex 1

Processi: P1, P2, P3

Lunghezza dei CPU-burst (ms):

- P1: 15+5
- P2: 7+9
- P3: 4+7

Attese di I/O brevi: 3 ms

Politiche di scheduling:

- Round Robin (quanto di tempo: 5 ms)
- Shortest Job First (SJF)
- First Come First Serve (FCFS)

1. Si discuta qual’è l’ordine di esecuzione del processi con le politiche di scheduling.

- RR: P1, P2, P3, P1, P2, P3, P1, P2, P3, P1, P2
- SJF: P3, P2, P3, P2, P1
- FCFS: P1, P2, P3, P1, P2, P3


1. Si calcoli anche il tempo medio di attesa e il tempo medio di turnaround che si ottengono con le due politiche di scheduling.

Attesa:
- RR: (23 + 31 + 27) / 3 = 27ms
- SJF: (27 + 11 + 7) / 3 = 15ms
- FCFS: (11 + 24 + 36) / 3 = 23.6

Turn-around:
- RR: (43 + 47 + 38) / 3 = 42.6ms
- SJF: (47 + 27 + 18) / 3 = 30.6ms
- FCFS: (31 + 40 + 47) / 3 = 39.3ms
