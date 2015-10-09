typedef struct queue *Q;
void QUEUEdump(Q);
Q QUEUEinit(int maxN);
int QUEUEempty(Q);
void QUEUEput(Q, Item);
Item QUEUEget(Q);