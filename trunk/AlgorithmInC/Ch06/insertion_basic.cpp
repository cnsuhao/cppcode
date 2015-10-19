#include "Item.h"
void sort(Item a[], int l, int r)
{
    int i, j;

    for (i = l + 1; i <= r; i++)
        for (j = i; j > l; j--)
            compexch(a[j - 1], a[j]);
}