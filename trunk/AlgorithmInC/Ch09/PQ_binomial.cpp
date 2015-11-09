#include <stdlib.h>
#include "PQ_link_heap.h"
#define maxBQsize 1000

PQlink pair(PQlink p, PQlink q)
{
    PQlink t;

    if (less(p->key, q->key))
    {
        p->r = q->l;
        q->l = p;
        return q;
    }
    else
    {
        q->r = p->l;
        p->l = q;
        return p;
    }
}


#define test(C, B, A) 4*(C) + 2*(B) + 1*(A)
void BQjoin(PQlink* a, PQlink* b)
{
    int i;
    PQlink c = NULL;

    for (i = 0; i < maxBQsize; i++)
        switch (test(c != NULL, b[i] != NULL, a[i] != NULL))
    {
        case 2:
            a[i] = b[i];
            break;

        case 3:
            c = pair(a[i], b[i]);
            a[i] = NULL;
            break;

        case 4:
            a[i] = c;
            c = NULL;
            break;

        case 5:
            c = pair(c, a[i]);
            a[i] = NULL;
            break;

        case 6:
        case 7:
            c = pair(c, b[i]);
            break;
    }
}

void PQjoin(PQ a, PQ b)
{
    BQjoin(a->bq, b->bq);
}

PQlink PQinsert(PQ pq, Item v)
{
    int i;
    PQlink c, t = (PQlink)malloc(sizeof * t);
    c = t;
    c->l = NULL;
    c->r = NULL;
    c->key = v;

    for (i = 0; i < maxBQsize; i++)
    {
        if (c == NULL) break;

        if (pq->bq[i] == NULL)
        {
            pq->bq[i] = c;
            break;
        }

        c = pair(c, pq->bq[i]);
        pq->bq[i] = NULL;
    }

    return t;
}

Item PQdelmax(PQ pq)
{
    int i, j, max;
    PQlink x;
    Item v;
    PQlink temp[maxBQsize];

    for (i = 0, max = -1; i < maxBQsize; i++)
        if (pq->bq[i] != NULL)
            if ((max == -1) || (pq->bq[i]->key > v))
            {
                max = i;
                v = pq->bq[max]->key;
            }

    x = pq->bq[max]->l;

    for (i = max; i < maxBQsize; i++) temp[i] = NULL;

    for (i = max ; i > 0; i--)
    {
        temp[i - 1] = x;
        x = x->r;
        temp[i - 1]->r = NULL;
    }

    free(pq->bq[max]);
    pq->bq[max] = NULL;
    BQjoin(pq->bq, temp);
    return v;
}
