#include "FixUpDown.h"
void fixUp(Item a[], int k)
{
    while (k > 1 && less(a[k / 2], a[k]))
    {
        exch(a[k], a[k / 2]);
        k = k / 2;
    }
}

void fixDown(Item a[], int k, int N)
{
    int j;

    while (2 * k <= N)
    {
        j = 2 * k;

        if (j < N && less(a[j], a[j + 1])) j++;

        if (!less(a[k], a[j])) break;

        exch(a[k], a[j]);
        k = j;
    }
}