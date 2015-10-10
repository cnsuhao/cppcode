#include <stdio.h>
#include <stdlib.h>
#include "POLY_adt.h"
struct poly
{
    int N;
    int* a;
};
Poly POLYterm(int coeff, int exp)
{
    int i;
    Poly t = (Poly)malloc(sizeof * t);
    t->a = (int*)malloc((exp + 1) * sizeof(int));
    t->N = exp + 1;
    t->a[exp] = coeff;

    for (i = 0; i < exp; i++) t->a[i] = 0;

    return t;
}
Poly POLYadd(Poly p, Poly q)
{
    int i;
    Poly t;

    if (p->N < q->N)
    {
        t = p;
        p = q;
        q = t;
    }

    for (i = 0; i < q->N; i++) p->a[i] += q->a[i];

    return p;
}
Poly POLYmult(Poly p, Poly q)
{
    int i, j;
    Poly t = POLYterm(0, (p->N - 1) + (q->N - 1));

    for (i = 0; i < p->N; i++)
        for (j = 0; j < q->N; j++)
            t->a[i + j] += p->a[i] * q->a[j];

    return t;
}
float POLYeval(Poly p, float x)
{
    int i;
    double t = 0.0;

    for (i = p->N - 1; i >= 0; i--)
        t = t * x + p->a[i];

    return t;
}

void showterm(int coff, int exp, bool bNeedPlus)
{
    if (bNeedPlus)
    {
        printf(" + ");
    }

    if (exp == 0)
    {
        printf("%d", coff);
    } 
    else
    {
        if (coff == 1)
        {
            printf("x^%d", coff, exp);
        } 
        else
        {
            printf("%dx^%d", coff, exp);
        }
    }
}
void showPOLY(Poly p)
{
    bool bNeedPlus = false;
    for (int i = p->N - 1; i >= 1; i--)
    {
        if (p->a[i] > 0)
        {
            showterm(p->a[i], i, bNeedPlus);
            bNeedPlus = true;
        } 
    }
    if (p->N >= 1 && p->a[0] > 0)
    {
        showterm(p->a[0], 0, bNeedPlus);
    }

    printf("\n");
}
