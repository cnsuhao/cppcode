#include "Item.h"
#include "insertion.h"
#define maxN 10000
Item aux[maxN];
void mergeAB(Item c[], Item a[], int N, Item b[], int M)
{
    int i, j, k;

    for (i = 0, j = 0, k = 0; k < N + M; k++)
    {
        if (i == N)
        {
            c[k] = b[j++];
            continue;
        }

        if (j == M)
        {
            c[k] = a[i++];
            continue;
        }

        c[k] = (less(a[i], b[j])) ? a[i++] : b[j++];
    }
}
void mergesortABr(Item a[], Item b[], int l, int r)
{
    int m = (l + r) / 2;

    if (r - l <= 10)
    {
        insertion_sort(a, l, r);
        return;
    }

    mergesortABr(b, a, l, m);
    mergesortABr(b, a, m + 1, r);
    mergeAB(a + l, b + l, m - l + 1, b + m + 1, r - m);
}
void mergesortAB(Item a[], int l, int r)
{
    int i;

    for (i = l; i <= r; i++) aux[i] = a[i];

    mergesortABr(a, aux, l, r);
}