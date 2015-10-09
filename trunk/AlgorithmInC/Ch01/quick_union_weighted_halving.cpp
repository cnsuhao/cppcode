#include <stdio.h>
#define N 10000
int main()
{
    int i, j, p, q, id[N], sz[N];

    for (i = 0; i < N; i++)
    {
        id[i] = i;
        sz[i] = 1;
    }

    while (scanf("%d %d\n", &p, &q) == 2)
    {
        for (i = p; i != id[i]; i = id[i])
        {
            int t = i;
            i = id[id[t]];
            id[t] = i;
        }

        for (j = q; j != id[j]; j = id[j]) ;

        {
            int t = j;
            j = id[id[t]];
            id[t] = j;
        }
    }
}