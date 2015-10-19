#include "Item.h"

void sort(Item a[], int l, int r)
{
    int i;

    for (i = l + 1; i <= r; i++) compexch(a[l], a[i]);

    for (i = l + 2; i <= r; i++)
    {
        int j = i;
        Item v = a[i];

        while (less(v, a[j - 1]))
        {
            a[j] = a[j - 1];
            j--;
        }

        a[j] = v;
    }
}


void insertion(Item a[], int l, int r)
{
    int i, j;

    for (i = l + 1; i <= r; i++)
        for (j = i; j > l; j--)
            if (less(a[j - 1], a[j])) break;
            else exch(a[j - 1], a[j]);
}