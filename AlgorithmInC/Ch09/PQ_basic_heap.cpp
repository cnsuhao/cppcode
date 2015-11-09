
#include <stdlib.h>
#include "PQ_basic.h"
#include "FixUpDown.h"
static Item* pq;
static int N;

void PQinit(int maxN)
{
    pq = (Item*)malloc((maxN + 1) * sizeof(Item));
    N = 0;
}
int PQempty()
{
    return N == 0;
}
void PQinsert(Item v)
{
    pq[++N] = v;
    fixUp(pq, N);
}
Item PQdelmax()
{
    exch(pq[1], pq[N]);
    fixDown(pq, 1, N - 1);
    return pq[N--];
}

void PQsort(Item a[], int l, int r)
{
    int k;
    PQinit(100);

    for (k = l; k <= r; k++) PQinsert(a[k]);

    for (k = r; k >= l; k--) a[k] = PQdelmax();
}

#define pq(A) a[l-1+A]
void heapsort(Item a[], int l, int r)
{
    int k, N = r - l + 1;

    for (k = N / 2; k >= 1; k--)
        fixDown(&pq(0), k, N);

    while (N > 1)
    {
        exch(pq(1), pq(N));
        fixDown(&pq(0), 1, --N);
    }
}