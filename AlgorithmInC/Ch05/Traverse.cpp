#include "stdio.h"
#include "stdlib.h"
#include "Item.h"
#include "queue_adt.h"

typedef struct Tnode* link;
struct Tnode
{
    int v;
    link next;
};

#define MAX_V 100
int visited[MAX_V];
link adj[MAX_V];
void traverse(int k, void (*visit)(int))
{
    link t;
    (*visit)(k);
    visited[k] = 1;

    for (t = adj[k]; t != NULL; t = t->next)
        if (!visited[t->v]) traverse(t->v, visit);
}

void traverse_queue(int k, void (*visit)(int))
{
    link t;
    Q myqueue = QUEUEinit(100);
    QUEUEput(myqueue, k);

    while (!QUEUEempty(myqueue))
        if (visited[k = QUEUEget(myqueue)] == 0)
        {
            (*visit)(k);
            visited[k] = 1;

            for (t = adj[k]; t != NULL; t = t->next)
                if (visited[t->v] == 0) QUEUEput(myqueue, t->v);
        }
}

int count(link x)
{
    if (x == NULL) return 0;

    return 1 + count(x->next);
}
void traverse(link h, void (*visit)(link))
{
    if (h == NULL) return;

    (*visit)(h);
    traverse(h->next, visit);
}
void traverseR(link h, void (*visit)(link))
{
    if (h == NULL) return;

    traverseR(h->next, visit);
    (*visit)(h);
}
bool eq(int x, int v)
{
    return x == v;
}
link delete_item(link x, Item v)
{
    if (x == NULL) return NULL;

    if (eq(x->v, v))
    {
        link t = x->next;
        free(x);
        return t;
    }

    x->next = delete_item(x->next, v);
    return x;
}

Item max(Item a[], int l, int r)
{
    Item u, v;
    int m = (l + r) / 2;

    if (l == r) return a[l];

    u = max(a, l, m);
    v = max(a, m + 1, r);

    if (u > v) return u;
    else return v;
}