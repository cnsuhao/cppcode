typedef char* Item;
#define key(A) (A)
#define less(A, B) (strcmp(A, B) < 0)
#define exch(A, B) { Item t = A; A = B; B = t; }
#define compexch(A, B) if (less(B, A)) exch(A, B)
Item ITEMrand(void);
int ITEMscan(Item*);
void ITEMshow(Item);