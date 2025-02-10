# Sincronizzazione di 3 Processi coi Semafori

Il Processo A sveglia il processo B e il C poi si sospende in attesa che B e C abbiano terminato le operazioni sulle variabili condivise x, y e z. Una volta che B e C hanno terminato le operazioni svegliano A, B termina e C si ferma.. A questo punto A stampa i valori delle variabili x e y e sveglia C che stampa il valore di z.

Si correggano e/o completino i seguenti frammenti di codice, considerando mutex inizializzato a 1 e gli altri semafori inizializzati a 0.

## Svolgimento

```
Process A {
    V(SemB)
    V(SemC)
    P(SemA)
    P(SemA)
    P(mutex)
    Print(x)
    Print(y)
    V(mutex)
    V(SemC)
}
```

```
Process B {
    P(SemB)
    P(mutex)
    y = y * 2
    z = x + y
    V(mutex)
    V(SemA)
}
```

```
Process C {
    P(SemC)
    P(mutex)
    y = y * x
    V(mutex)
    V(SemA)
    P(SemC)
    P(mutex)
    Print(z)
    V(mutex)
}
```
