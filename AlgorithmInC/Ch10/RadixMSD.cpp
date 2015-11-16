#include "Item.h"
#include "digit.h"
#include "insertion.h"
#define bin(A) l+count[A]
#define M 10
Item aux[M];

void radixMSD(Item a[], int l, int r, int w)
{
    int i, j, count[byte_radix + 1];

    if (w > bytesword) return;

    if (r - l <= M)
    {
        insertion_sort(a, l, r);
        return;
    }

    for (j = 0; j <= byte_radix; j++) count[j] = 0;

    for (i = l; i <= r; i++)
        count[get_byte(a[i], w) + 1]++;

    for (j = 1; j <= byte_radix; j++)
        count[j] += count[j - 1];

    for (i = l; i <= r; i++)
        aux[l + count[get_byte(a[i], w)]++] = a[i];

    for (i = l; i <= r; i++) a[i] = aux[i];

    radixMSD(a, l, bin(0) - 1, w + 1);

    for (j = 0; j < byte_radix - 1; j++)
        radixMSD(a, bin(j), bin(j + 1) - 1, w + 1);
}