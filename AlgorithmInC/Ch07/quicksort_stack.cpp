#include "Item.h"
#include "stack.h"
#include "Partition.h"
#define push2(A, B)  STACKpush(B); STACKpush(A);
void quicksort(Item a[], int l, int r)
{
    int i;
    STACKinit(10);
    push2(l, r);

    while (!STACKempty())
    {
        l = STACKpop();
        r = STACKpop();

        if (r <= l) continue;

        i = partition(a, l, r);

        if (i - l > r - i)
        {
            push2(l, i - 1);
            push2(i + 1, r);
        }
        else
        {
            push2(i + 1, r);
            push2(l, i - 1);
        }
    }
}