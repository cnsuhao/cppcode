int factorial(int N)
{
    if (N == 0) return 1;

    return N * factorial(N - 1);
}

int puzzle(int N)
{
    if (N == 1) return 1;

    if (N % 2 == 0)
        return puzzle(N / 2);
    else return puzzle(3 * N + 1);
}

int gcd(int m, int n)
{
    if (n == 0) return m;

    return gcd(n, m % n);
}

char* a;
int i;
int eval()
{
    int x = 0;

    while (a[i] == ' ') i++;

    if (a[i] == '+')
    {
        i++;
        return eval() + eval();
    }

    if (a[i] == '*')
    {
        i++;
        return eval() * eval();
    }

    while ((a[i] >= '0') && (a[i] <= '9'))
        x = 10 * x + (a[i++] - '0');

    return x;
}

void shift(int N, int d)
{

}

void hanoi(int N, int d)
{
    if (N == 0) return;

    hanoi(N - 1, -d);
    shift(N, d);
    hanoi(N - 1, -d);
}

void mark(int m, int h)
{

}
void rule_recursive(int l, int r, int h)
{
    int m = (l + r) / 2;

    if (h > 0)
    {
        rule_recursive(l, m, h - 1);
        mark(m, h);
        rule_recursive(m, r, h - 1);
    }
}

void rule_iter(int l, int r, int h)
{
    int i, j, t;

    for (t = 1, j = 1; t <= h; j += j, t++)
        for (i = 0; l + j + i <= r; i += j + j)
            mark(l + j + i, t);
}

int F(int i)
{
    if (i < 1) return 0;

    if (i == 1) return 1;

    return F(i - 1) + F(i - 2);
}

#define unknown -1
#define Max_Known 1000
int knownF[Max_Known];
int F_dyn(int i)
{
    int t;

    if (knownF[i] != unknown) return knownF[i];

    if (i == 0) t = 0;

    if (i == 1) t = 1;

    if (i > 1) t = F_dyn(i - 1) + F_dyn(i - 2);

    return knownF[i] = t;
}

struct Item
{
    int size;
    int val;
};
#define N 1000
Item items[N];

int knap(int cap)
{
    int i, space, max, t;

    for (i = 0, max = 0; i < N; i++)
        if ((space = cap - items[i].size) >= 0)
            if ((t = knap(space) + items[i].val) > max)
                max = t;

    return max;
}

#define MAX_SIZE 100
int maxKnown[MAX_SIZE];
Item itemKnown[MAX_SIZE];

int knap_dyn(int M)
{
    int i, space, max, maxi, t;

    if (maxKnown[M] != unknown) return maxKnown[M];

    for (i = 0, max = 0; i < N; i++)
        if ((space = M - items[i].size) >= 0)
            if ((t = knap_dyn(space) + items[i].val) > max)
            {
                max = t;
                maxi = i;
            }

    maxKnown[M] = max;
    itemKnown[M] = items[maxi];
    return max;
}