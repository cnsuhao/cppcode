#include "Item.h"
Item aux[1000];
void merge(Item a[], int l, int m, int r)
{
    int i, j, k;

    for (i = m; i >= l; i--) aux[i] = a[i];

    for (j = m + 1; j <= r; j++) aux[r + m + 1 - j] = a[j];

    for (k = l, i = l, j = r; k <= r; k++)
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
    int i, middle;

    for (middle = 1; middle < r - l; middle = middle + middle)
        for (i = l; i <= r - middle; i += middle + middle)
            merge(a, i, i + middle - 1, min(i + middle + middle - 1, r));
}