/**
 * A pthread program illustrating how to
 * create a simple thread and some of the pthread API
 * This program implements the summation function where
 * the summation operation is run as a separate thread.
 *
 * Most Unix/Linux/OS X users
 * gcc thrd.c -lpthread
 *
 * Figure 4.11
 *
 * @author Gagne, Galvin, Silberschatz
 * Operating System Concepts  - Tenth Edition
 * Copyright John Wiley & Sons - 2018
 */

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

int sum; /* this data is shared by the thread(s) */

void *runner(void *param); /* the thread */

int main(int argc, char *argv[])
{
	pthread_t tid; /* the thread identifier */

	/* Ogni thread ha un insieme di attributi che includono la dimensione dello stack e informazioni di scheduling.
	La dichiarazione pthread_attr_t attr riguarda la struttura dati per gli attributi del thread, i cui valori 
	si assegnano con la chiamata di funzione pthread_attr_init(&attr). 	 */
	pthread_attr_t attr; /* set of attributes for the thread */

	if (argc != 2) {
		fprintf(stderr,"usage: a.out <integer value>\n");
		/*exit(1);*/
		return -1;
	}

	if (atoi(argv[1]) < 0) {
		fprintf(stderr,"Argument %d must be non-negative\n",atoi(argv[1]));
		/*exit(1);*/
		return -1;
	}

	/* Poiché non sono stati esplicitamente forniti valori per gli attributi, si 
	usano quelli predefiniti. */
	pthread_attr_init(&attr);

	/* create the thread 
	La chiamata di funzione ­pthread_create() crea un nuovo thread. Oltre all’identificatore del thread e ai 
	suoi attributi, si passa anche il nome della funzione da cui il nuovo thread inizierà l’esecuzione, 
	in questo caso la funzione runner(), e il numero intero fornito come parametro alla riga di comando, 
	e individuato da argv[1].	
	*/
	pthread_create(&tid,&attr,runner,argv[1]);

	/* now wait for the thread to exit */
	pthread_join(tid,NULL);

	printf("sum = %d\n",sum);
}

/**
 * The thread will begin control in this function
 */
void *runner(void *param) 
{
	int i, upper = atoi(param);
	sum = 0;

	if (upper > 0) {
		for (i = 1; i <= upper; i++)
			sum += i;
	}

	pthread_exit(0);
}
