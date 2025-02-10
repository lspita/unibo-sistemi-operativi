# MONITOR: Ponte a senso unico alternato (con limite di auto sul ponte)

Un ponte molto stretto consente l’accesso esclusivamente a senso unico alternato. Le automobili possono accedere in una sola direzione per volta, ovvero possono passare le auto che vanno dalla sponda nord alla sud oppure quelle che vanno dalla sponda sud alla nord. Non esistono priorità tra i processi auto. Un processo auto può attraversare il ponte solo se non
vi sono sopra processi dell’altro tipo. Inizialmente il ponte è vuoto, non ci sono auto in attesa e la direzione corrente è nord-sud. Il numero massimo di auto che possono stare contemporaneamente sul ponte è MAX.

Correggere e/o completare le seguenti procedure che propongono la sincronizzazione dei processi coinvolti in questo scenario, utilizzando i costrutti dei monitor. Fornire una soluzione che eviti deadlock e starvation.

Le variabili condivise sono le seguenti
- **Coda_SN**: variabile condition sulla quale le auto in direzione sud-nord si sospendono e si risvegliano.
- **Coda_NS**: variabile condition sulla quale le auto in direzione nord-sud si sospendono e si risvegliano.
- **In_coda_SN**: variabile intera che indica il numero delle auto in attesa di salire sul ponte, che si muovono in direzione sud-nord.
- **In_coda_NS**: variabile intera che indica il numero delle auto in attesa di salire sul ponte, che si muovono in direzione nord-sud.
- **Dir**: variabile che indica la direzione corrente di attraversamento del ponte, può assumere valore SN (da Sud a Nord) o NS (da Nord a Sud).
- **N_auto**: variabile intera che indica il numero delle auto che sono sul ponte in un certo momento.

```
monitor Ponte_a_senso_unico_alternato {
    int in_coda_SN, in_coda_NS, n_auto;
    condition coda_SN, coda_NS;
    typedef direzione = {SN, NS};
    direzione dir;
}
```

## A. Completare la procedura entra_ponte_SN invocata dal processo Auto_SN

```
void entra_ponte_SN() {
    boolean entrato;
    entrato=false;
    in_coda_sn++;
    while (not(entrato)) {
        if (in_coda_sn > 0 || dir == NS || n_auto == MAX) {
            coda_SN.wait();
        }
        else {
            n_auto++;
            entrato = true;
        }
    }
    if (in_coda_sn > 0) {
        coda_SN.signal()
    }
    in_coda_sn--;
}
```

## B. Completare la procedura esci_ponte_SN invocata dal processo Auto_SN

```
void esci_ponte_SN() {
    n_auto--;
    if (n_auto == 0) {
        dir = NS;
        coda_NS.signal();
    }
}
```

## C. Completare e/o correggere la procedura entra_ponte_NS invocata dal processo Auto_NS

```
void entra_ponte_NS() {
    boolean entrato;
    entrato=false;
    in_coda_ns++;
    while (not(entrato)) {
        if (in_coda_ns > 0 || dir == SN || n_auto == MAX) {
            coda_NS.wait();
        }
        else {
            n_auto++;
            entrato = true;
        }
    }
    if (in_coda_ns > 0) {
        coda_NS.signal()
    }
    in_coda_ns--;
}
```

## D. Completare e/o correggere la procedura esci_ponte_NS invocata dal processo Auto_NS

```
void esci_ponte_NS() {
    n_auto--;
    if (n_auto == 0) {
        dir = SN;
        coda_SN.signal();
    }
}
```

## E. inizializzare le variabili necessaria/e alla sincronizzazione richiesta

```
void inizializzazione() {
    in_coda_SN = 0
    in_coda_NS = 0
    n_auto = 0
    dir = NS
}
```
