# Fornire una descrizione di Semaforo

Un semaforo è un costrutto fornito dal sistema operativo per la sincronizzazione dei processi nell'accesso a risorse condivise in mutua esclusione. Il semaforo presenta internamente un valore intero ed è costituito da due primitive:
- P(): decrementa il valore e, se diventa negativo, mette il processo in uno stato di busy-waiting attendendo che il valore ritorni almeno 0.
- V(): incrementa il valore.
Questo permette di ridurre la sezione critica a solo queste due operazioni invece che tutta la parte di codice che accede alle risorse condivise.