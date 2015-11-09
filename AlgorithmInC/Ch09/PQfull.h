#include "Item.h"
#include "PQ_link.h"

PQ PQinit();
int PQempty(PQ);
PQlink PQinsert(PQ, Item);
Item PQdelmax(PQ);
void PQchange(PQ, PQlink, Item);
void PQdelete(PQ, PQlink);
void PQjoin(PQ, PQ);