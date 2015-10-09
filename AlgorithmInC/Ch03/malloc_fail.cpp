#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[])
{   long int i, j, N = atoi(argv[1]);
    int *a = (int *)malloc(N*sizeof(int));
    if (a == NULL)
    {
        printf("Insufficient memory.\n");
        return -1;
    }
}