#include <stdlib.h>
static int *s, *t;
static int N;
#define MAX_VALUE 10000
void STACKinit(int maxN)
{   int i;
    s = (int *)malloc(maxN*sizeof(int));
    t = (int *)malloc(MAX_VALUE*sizeof(int));
    for (i = 0; i < MAX_VALUE; i++) t[i] = 0;
    N = 0;
}
int STACKempty()
{
    return !N;
}
void STACKpush(int item)
{
    if (t[item] == 1) return;
    s[N++] = item;
    t[item] = 1;
}
int STACKpop()
{
    N--;
    t[s[N]] = 0;
    return s[N];
}