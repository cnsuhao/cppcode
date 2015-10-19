#include <stdio.h>
#include "Item.h"
typedef struct node* link;
struct node
{
    Item item;
    link next;
};
link NEW(Item, link);
link init(int);
void show(link);
link sort(link);


link findmax(link h)
{
    link max_pre_node = NULL;

    while (h != NULL || h->next != NULL)
    {
        if (max_pre_node == NULL || max_pre_node->item < h->next->item)
        {
            max_pre_node = h;
        }
        h = h->next;
    }

    return max_pre_node;
}

link listselection(link h)
{
    link max, t, out = NULL;

    while (h->next != NULL)
    {
        max = findmax(h);
        t = max->next;
        max->next = t->next;
        t->next = out;
        out = t;
    }

    h->next = out;
    return (h);
}
