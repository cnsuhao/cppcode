#ifndef PQ_link_h__
#define PQ_link_h__

#include "Item.h"

typedef struct pq* PQ;
typedef struct PQnode* PQlink;
struct PQnode
{
    Item key;
    PQlink r, l;
};
struct pq
{
    PQlink* bq;
};

#endif // PQ_link_h__