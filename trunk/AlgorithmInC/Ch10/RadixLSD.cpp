#include "Item.h"
#include "digit.h"
#define M 10
Item aux[M];

void radixLSD(Item a[], int l, int r)
{
    int i, j, w, count[byte_radix + 1];

    for (w = bytesword - 1; w >= 0; w--)
    {
        for (j = 0; j <= byte_radix; j++) count[j] = 0;

        for (i = l; i <= r; i++)
            count[get_byte(a[i], w) + 1]++;

        for (j = 1; j <= byte_radix; j++)
            count[j] += count[j - 1];

        for (i = l; i <= r; i++)
            aux[count[get_byte(a[i], w)]++] = a[i];

        for (i = l; i <= r; i++) a[i] = aux[i];
    }
}