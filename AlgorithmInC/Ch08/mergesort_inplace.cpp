#include "Item.h"
Item aux[1000];
void merge(Item a[], int l, int m, int r)
{
    int i, j, k;

    for (i = m + 1; i > l; i--) aux[i - 1] = a[i - 1];

    for (j = m; j < r; j++) aux[r + m - j] = a[j + 1];

    for (k = l; k <= r; k++)
        if (less(aux[i], aux[j]))
            a[k] = aux[i++];
        else a[k] = aux[j--];
}

void mergesort(Item a[], int l, int r)
{
    int m = (r + l) / 2;

    if (r <= l) return;

    mergesort(a, l, m);
    mergesort(a, m + 1, r);
    merge(a, l, m, r);
}

#define min(A, B) (A < B) ? A : B
void mergesortBU(Item a[], int l, int r)
{
    int i, m;

    for (m = 1; m < r - l; m = m + m)
        for (i = l; i <= r - m; i += m + m)
            merge(a, i, i + m - 1, min(i + m + m - 1, r));
}