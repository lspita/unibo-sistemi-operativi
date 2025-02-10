# Sincronizzazione con Message Passing

Completare il seguente frammento di codice relativo alla esecuzione di due processi, utilizzando i costrutti di Message Passing in modo che l’ordine delle istruzioni eseguite dai due processi sia il seguente:

- Istr_A1;
- Istr_B1;
- La computazione di Istr_A2 deve avvenire concorrentemente a Istr_B2
- A e B effettuano un rendez-vous
- La computazione di Istr_A3 deve avvenire concorrentemente a Istr_B3.
- Istr_A4
- Istr_B4.

Si considerino la Send NON Bloccante e la Receive Bloccante.

## Svolgimento

```
Process A {
    Istr_A1;
    send(ack, B)
    receive(B)
    Istr_A2;
    send(ack, B)
    receive(B)
    Istr_A3;
    Istr_A4;
    send(ack, B)
}
```

```
Process B {
    receive(A)
    Istr_B1;
    send(ack, A)
    Istr_B2;
    receive(A)
    send(ack, A)
    Istr_B3;
    receive(A)
    Istr_B4;
}
```
