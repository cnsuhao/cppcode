#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "Point.h"

float randFloat()
{
    return 1.0 * rand() / RAND_MAX;
}

int** malloc2d(int r, int c)
{
    int i;
    int** t = (int**)malloc(r * sizeof(int*));

    for (i = 0; i < r; i++)
        t[i] = (int*)malloc(c * sizeof(int));

    return t;
}

typedef struct node* link;
struct node
{
    point p;
    link next;
};
link** grid;
int G;
float d;
int cnt = 0;
void gridinsert(float x, float y)
{
    int i, j;
    link s;
    int X = x * G + 1;
    int Y = y * G + 1;
    link t = (link)malloc(sizeof * t);
    t->p.x = x;
    t->p.y = y;

    for (i = X - 1; i <= X + 1; i++)
        for (j = Y - 1; j <= Y + 1; j++)
            for (s = grid[i][j]; s != NULL; s = s->next)
                if (distance(s->p, t->p) < d) cnt++;

    t->next = grid[X][Y];
    grid[X][Y] = t;
}
int main(int argc, char* argv[])
{
    int i, j, N = atoi(argv[1]);
    d = atof(argv[2]);
    G = 1 / d;
    grid = (link**)malloc2d(G + 2, G + 2);

    for (i = 0; i < G + 2; i++)
        for (j = 0; j < G + 2; j++)
            grid[i][j] = NULL;

    for (i = 0; i < N; i++)
        gridinsert(randFloat(), randFloat());

    printf("%d edges shorter than %f\n", cnt, d);
}