#include <stdio.h>
#include <time.h>

#define N 10000

typedef unsigned long long ull;

ull a[N][N];

void main() {
    ull sum = 0;
    clock_t start, end;
    double duration;

    start = clock();

    for (ull i = 0; i < N; i++) {
        for (ull j = 0; j < N; j++) {
            sum += a[i][j];
        }
    }

    end = clock();
    duration = ((double)(end - start)) / CLOCKS_PER_SEC * 1000000;

 
}
