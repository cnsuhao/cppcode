#include "Item.h"
#include "insertion.h"
#include "digit.h"
#define ch(A) digit(A, D)
#define M 10
void quicksortX(Item a[], int l, int r, int D)
{
    int i, j, k, p, q;
    int v;

    if (r - l <= M)
    {
        insertion_sort(a, l, r);
        return;
    }

    v = ch(a[r]);
    i = l - 1;
    j = r;
    p = l - 1;
    q = r;
    
    while (i < j)
    {
        while (ch(a[++i]) < v) ;

        k = j;
        while (v < ch(a[--k])) if (k == l) break;
        if (ch(a[k]) <= v)
        {
            j = k;
        }

        if (i > j) break;

        exch(a[i], a[j]);

        if (ch(a[i]) == v)
        {
            p++;
            exch(a[p], a[i]);
        }

        if (v == ch(a[j]))
        {
            q--;
            exch(a[j], a[q]);
        }
    }

    if (j > p)
    {
        for (k = l; k <= p; k++, j--) exch(a[k], a[j]);
        quicksortX(a, l, j, D);
    }
    else
    {
        j = l - 1;
    }

    if (i < q)
    {
        for (k = r; k >= q; k--, i++) exch(a[k], a[i]);
        quicksortX(a, i, r, D);
    }
    else
    {
        i = r + 1;
    }

    if (v != '\0') quicksortX(a, j + 1, i - 1, D + 1);
}