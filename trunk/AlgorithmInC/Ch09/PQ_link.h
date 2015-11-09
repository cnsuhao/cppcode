#ifndef PQ_link_h__
#define PQ_link_h__

#include "Item.h"

typedef struct pq* PQ;
typedef struct PQnode* PQlink;
struct PQnode
{
    Item key;
    PQlink prev, next;
};
struct pq
{
    PQlink head, tail;
};

#endif // PQ_link_h__