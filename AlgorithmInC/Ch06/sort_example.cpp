#include <stdio.h>
#include <stdlib.h>
#include "Item.h"

int main(int argc, char* argv[])
{
    int i, N = atoi(argv[1]), sw = atoi(argv[2]);
    int* a = (int*)malloc(N * sizeof(int));

    if (sw)
        for (i = 0; i < N; i++)
            a[i] = 1000 * (1.0 * rand() / RAND_MAX);
    else
        while (scanf("%d", &a[N]) == 1) N++;

    sort(a, 0, N - 1);

    for (i = 0; i < N; i++) printf("%3d ", a[i]);

    printf("\n");
}