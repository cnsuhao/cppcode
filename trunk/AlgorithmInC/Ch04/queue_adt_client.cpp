#include <stdio.h>
#include <stdlib.h>
#include "Item.h"
#include "QUEUE_adt.h"
#define M 10
int main(int argc, char* argv[])
{
    int i, j, N = atoi(argv[1]);
    Q queues[M];

    for (i = 0; i < M; i++)
        queues[i] = QUEUEinit(N);

    for (i = 0; i < N; i++)
        QUEUEput(queues[rand() % M], i);

    for (i = 0; i < M; i++, printf("\n"))
        for (j = 0; !QUEUEempty(queues[i]); j++)
            printf("%3d ", QUEUEget(queues[i]));
}