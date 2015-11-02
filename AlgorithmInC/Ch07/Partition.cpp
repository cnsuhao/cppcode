#include "Item.h"
int partition(Item a[], int l, int r)
{
    int i = l, j = r - 1;
    Item v = a[r];

    for (;;)
    {
        while (less(a[i], v)) i++;

        while (less(v, a[j]))
        {
            if (j == l) break;
            j--;
        }

        if (i >= j) break;

        exch(a[i], a[j]);
    }

    exch(a[i], a[r]);
    return i;
}