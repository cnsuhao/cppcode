#include "Item.h"
#include "Partition.h"
void select(Item a[], int l, int r, int k)
{
    int i;

    if (r <= l) return;

    i = partition(a, l, r);

    if (i < k)
    {
        select(a, i + 1, r, k);
    } 
    else if (i > k)
    {
        select(a, l, i - 1, k);
    }
    else
    {
        return;
    }
}

void select_iter(Item a[], int l, int r, int k)
{
    while (r > l)
    {
        int i = partition(a, l, r);

        if (i < k)
        {
            l = i + 1;
        } 
        else if (i > k)
        {
            r = i - 1;
        }
        else
        {
            return;
        }
    }
}