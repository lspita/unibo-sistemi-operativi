# MONITOR: Bagno Unisex (con limite di persone nel bagno)

In una stazione di servizio lungo la A14 c’è un bagno solo che può essere condiviso da uomini e da donne, ma non contemporaneamente. Quando all’interno si trovano delle donne allora possono entrare soltanto altre donne e gli uomini devono attendere all’esterno. Quando all’interno si trovano degli uomini allora possono entrare soltanto altri uomini e le donne devono attendere all’esterno. Non esistono priorità tra i processi uomini e i processi donne. Inizialmente il bagno è vuoto, non ci sono uomini e donne in attesa. Il numero massimo di persone che possono stare contemporaneamente nel bagno è MAX.

Correggere e/o completare le seguenti procedure che propongono la sincronizzazione dei processi coinvolti in questo scenario, utilizzando i costrutti dei monitor. Fornire una soluzione che eviti deadlock e starvation.

Le variabili condivise sono le seguenti:
- **Uomini**: variabile condition sulla quale i processi uomini si sospendono e si risvegliano.
- **Donne**: variabile condition sulla quale i processi donne si sospendono e si risvegliano.
- **Uomini_in_attesa**: variabile intera che indica il numero dei processi uomini attesa di entrare nel bagno.
- **Donne_in_attesa**: variabile intera che indica il numero dei processi donne in attesa di entrare nel bagno.
- **Tipo**: variabile che indica il tipo di persone attualmente in bagno, può assumere valore “donne” o “uomini”.
- **Persone_in_bagno**: variabile intera che indica il numero delle persone che sono in bagno in un certo momento.

```
monitor Bagno_unisex {
    int donne_in_attesa, uomini_in_attesa, persone_in_bagno;
    condition uomini, donne;
    typedef tipo_persone = {donne, uomini};
    tipo_persone tipo;
}
```

## A. Completare e/o correggere la procedura donna_entra_bagno invocata dal processo Donna

```
void donna_entra_bagno() {
    boolean entrata;
    entrata=false;
    donne_in_attesa++;
    while (not(entrata)) {
        if (tipo == uomini && persone_in_bagno == 0) {
            tipo = donne;
        }
        if (tipo == uomini || persone_in_bagno == MAX) {
            donne.wait();
        } else {
            persone_in_bagno++;
            entrata = true;
        }
    }
    donne_in_attesa--;
    if (donne_in_attesa > 0) {
        donne.signal();
    }
}
```

## B. Completare e/o correggere la procedura donna_esce_bagno invocata dal processo Donna

```
void donna_esce_bagno() {
    persone_in_bagno--;
    if (persone_in_bagno == 0) {
        tipo = uomini;
        uomini.signal();
    }
}
```

## C. Completare e/o correggere la procedura uomo_entra_bagno invocata dal processo Uomo

```
void uomo_entra_bagno(){
    boolean entrato;
    entrato=false;
    uomini_in_attesa++;
    while (not(entrato)) {
        if (tipo == donne && persone_in_bagno == 0) {
            tipo = uomini;
        }
        if (tipo == donne || persone_in_bagno == MAX) {
            uomini.wait();
        } else {
            persone_in_bagno++;
            entrata = true;
        }
    }
    uomini_in_attesa--;
    if (uomini_in_attesa > 0) {
        uomini.signal();
    }
}
```

## D. Completare e/o correggere la procedura uomo_esce_bagno invocata dal processo Uomo

```
void uomo_esce_bagno() {
    persone_in_bagno--;
    if (persone_in_bagno == 0) {
        tipo = donne;
        donne.signal();
    }
}
```

## E. inizializzare le variabili necessaria/e alla sincronizzazione richiesta

```
void inizializzazione() {
    persone_in_bagno = 0
    uomini_in_attesa = 0
    donne_in_attesa = 0
    tipo = null
}
```
