#include "stdio.h"
#include "stdlib.h"

typedef int NodeItem;
typedef struct node* link;
typedef link Item;
#include "QUEUE.h"
#include "stack.h"

struct node
{
    NodeItem item;
    link l, r;
};

link NEW(NodeItem item, link l, link r)
{
    link x = (link)malloc(sizeof * x);
    x->item = item;
    x->l = l;
    x->r = r;
    return x;
}
link max(NodeItem a[], int l, int r)
{
    int m = (l + r) / 2;
    NodeItem u, v;
    link x = NEW(a[m], NULL, NULL);

    if (l == r) return x;

    x->l = max(a, l, m);
    x->r = max(a, m + 1, r);
    u = x->l->item;
    v = x->r->item;

    if (u > v)
        x->item = u;
    else x->item = v;

    return x;
}

void traverse(link h, void (*visit)(link))
{
    if (h == NULL) return;

    (*visit)(h);
    traverse(h->l, visit);
    traverse(h->r, visit);
}

int count(link h)
{
    if (h == NULL) return 0;

    return count(h->l) + count(h->r) + 1;
}
int height(link h)
{
    int u, v;

    if (h == NULL) return -1;

    u = height(h->l);
    v = height(h->r);

    if (u > v) return u + 1;
    else return v + 1;
}

void printnode(char c, int h)
{
    int i;

    for (i = 0; i < h; i++) printf("  ");

    printf("%c\n", c);
}
void show(link x, int h)
{
    if (x == NULL)
    {
        printnode('*', h);
        return;
    }

    show(x->r, h + 1);
    printnode(x->item, h);
    show(x->l, h + 1);
}

void traverse_stack(link h, void (*visit)(link))
{
    STACKinit(10);
    STACKpush(h);

    while (!STACKempty())
    {
        (*visit)(h = STACKpop());

        if (h->r != NULL) STACKpush(h->r);

        if (h->l != NULL) STACKpush(h->l);
    }
}

void traverse_queue(link h, void (*visit)(link))
{
    QUEUEinit(10);
    QUEUEput(h);

    while (!QUEUEempty())
    {
        (*visit)(h = QUEUEget());

        if (h->l != NULL) QUEUEput(h->l);

        if (h->r != NULL) QUEUEput(h->r);
    }
}