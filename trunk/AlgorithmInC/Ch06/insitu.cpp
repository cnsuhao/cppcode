#include "Item.h"
#define M 10000
#define maxN 10000

void insitu(Item data[], int a[], int N)
{
    int i, j, k;

    for (i = 0; i < N; i++)
    {
        Item v = data[i];

        for (k = i; a[k] != k; k = a[j], a[j] = j)
        {
            j = k;
            data[k] = data[a[k]];
        }

        data[k] = v;
        a[k] = k;
    }
}


void distcount(int a[], int l, int r)
{
    int i, j, index[M];
    int b[maxN];

    for (j = 0; j <  M; j++) index[j] = 0;

    for (i = l; i <= r; i++) index[a[i] + 1]++;

    for (j = 1; j <  M; j++) index[j] += index[j - 1];

    for (i = l; i <= r; i++) b[index[a[i]]++] = a[i];

    for (i = l; i <= r; i++) a[i] = b[i];
}
