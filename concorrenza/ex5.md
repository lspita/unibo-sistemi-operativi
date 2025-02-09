# MONITOR: Pasticceria Fagioli

Nella pasticceria Fagioli il pasticcere prepara i pasticcini da esporre sul bancone e i clienti acquistano i pasticcini scegliendoli e prendendoli direttamente dal bancone.

Il bancone ha una capacità massima di N pasticcini.

Quando il bancone è vuoto, i clienti si mettono in attesa che il pasticcere riempia nuovamente il bancone, producendo N pasticcini.

Una volta riempito il bancone, il pasticcere risveglia tutti i processi clienti in attesa dei pasticcini e poi si blocca.

Il cliente che acquista l’ultimo pasticcino, sveglia il pasticcere, affinché questo riempia nuovamente il bancone.

Ogni cliente acquista un solo pasticcino per volta.

Una volta acquistato il pasticcino, il cliente esce dalla pasticceria.

Inizialmente il bancone è pieno.

Correggere e/o completare le seguenti procedure che propongono la sincronizzazione dei processi coinvolti in questo scenario, utilizzando i costrutti dei monitor.

Il monitor utilizza le seguenti variabili:
- **pasticcere**: variabile condition che viene usata per gestire la sincronizzazione del processo pasticcere;
- **cliente**: variabile condition che viene usata per gestire la sincronizzazione dei processi clienti della pasticceria;
- **pasticcini_sul_bancone**: intero che indica il numero di pasticcini disponibili;
- **clienti_in_attesa**: intero che indica il numero di clienti in attesa dei pasticcini.

```
monitor Pasticceria_fagioli {
    condition pasticcere, cliente;
    int pasticcini_sul_bancone, clienti_in_attesa
}
```

## A. Completare la procedura prendi_pasticcino (invocata dal processo cliente)

```
void prendi_pasticcino {
    if (pasticcini_sul_bancone == 0) {
        clienti_in_attesa++;
        cliente.wait()
    }
    pasticcini_sul_bancone--;
    clienti_in_attesa--;
    if (pasticcini_sul_bancone == 0) {
        pasticcere.signal()
    } else if (clienti_in_attesa > 0) {
        cliente.signal()
    }
}
```

## B. Completare la procedura prepara_pasticcini (invocata dal processo pasticcere)

```
void prepara_pasticcini {
    while (true) {
        pasticcere.wait()
        pasticcini_sul_bancone = N
        cliente.signal()
    }
}
```
