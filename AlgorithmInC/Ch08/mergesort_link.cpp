#include <stdio.h>
#define less(A, B) A < B
#include "QUEUE.h"

link merge(link a, link b)
{
    struct node head;
    link c = &head;

    while ((a != NULL) && (b != NULL))
        if (less(a->item, b->item))
        {
            c->next = a;
            c = a;
            a = a->next;
        }
        else
        {
            c->next = b;
            c = b;
            b = b->next;
        }

    c->next = (a == NULL) ? b : a;
    return head.next;
}

link mergesort(link c)
{
    link a, b;

    if (c->next == NULL) return c;

    a = c;
    b = c->next;

    while ((b != NULL) && (b->next != NULL))
    {
        c = c->next;
        b = b->next->next;
    }

    b = c->next;
    c->next = NULL;
    return merge(mergesort(a), mergesort(b));
}

link mergesort_queue(link t)
{
    link u;

    for (QUEUEinit(10); t != NULL; t = u)
    {
        u = t->next;
        t->next = NULL;
        QUEUEput(t);
    }

    t = QUEUEget();

    while (!QUEUEempty())
    {
        QUEUEput(t);
        t = merge(QUEUEget(), QUEUEget());
    }

    return t;
}