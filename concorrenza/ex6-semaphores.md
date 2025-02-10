# Sincronizzazione di 3 Processi coi Semafori.

Si considerino i processi A, B e C che si sincronizzano come mostrato nel seguito attraverso i semafori Sem1, Sem2 e Sem3 (inizializzati a 0) e che operano sulle variabili condivise x, y e z, che sono inizializzate come segue: x = 1; y = 1; z = 1.

```
Process A {
    V(Sem1);
    x = x + z; // x = 2
    V(Sem2);
    P(Sem1);
    Print(x); // 2
    V(Sem3);
}
```

```
Process B {
    P(Sem1);
    P(Sem2);
    y = y - z; // y = 0
    V(Sem3);
    P(Sem2);
    Print(y); // 1
    V(Sem1);
}
```

```
Process C {
    P(Sem3);
    z = x; // z = 2
    V(Sem2);
    P(Sem 3);
    z= 2 *z; // z = 4
    Print(z); // 3
}
```

## Con quale ordine i tre processi stampano le variabili?

y x z

## Qual è il valore delle tre variabili che viene infine stampato?

0 2 4