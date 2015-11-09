#include <stdlib.h>
#include "PQindex.h"
#define maxPQ 1000
static int N, pq[maxPQ + 1], qp[maxPQ + 1];

int less(int i, int j)
{
    return true; // implement this function in client program
}

void exch(int i, int j)
{
    int t;
    t = i;
    i = j;
    j = t;
    t = qp[i];
    qp[i] = qp[j];
    qp[j] = t;
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



void PQinit()
{
    N = 0;
}
int PQempty()
{
    return !N;
}
void PQinsert(int k)
{
    qp[k] = ++N;
    pq[N] = k;
    fixUp(pq, N);
}
int PQdelmax()
{
    exch(pq[1], pq[N]);
    fixDown(pq, 1, --N);
    return pq[N + 1];
}
void PQchange(int k)
{
    fixUp(pq, qp[k]);
    fixDown(pq, qp[k], N);
}
