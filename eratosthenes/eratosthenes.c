#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#define SIZE 100000000
//#define SIZE 21474836480

/*
#define TEST
*/

int main() {
    /* array a containing primes */
    char* a = malloc(SIZE * sizeof(char));

    /* initialize the array with everything
     * prime to be ruled out by main loop */
    memset(a, 1, SIZE);

    unsigned long x, y, i;
    x = 0; y = 0; i = 0;

    /* zero and one not covered by loop */
    a[0] = 0;
    a[1] = 0;

    
    for (x = 2; x < SIZE; x += 2) {
        a[x] = 0;
    }

    a[2] = 1;

    for (x = 3; x*x < SIZE; x++) {
        if (a[x] == 1) {
            for (y = x; y*x < SIZE; y += 2) {
                a[y * x] = 0;
            }
        }
    }

#ifdef TEST
    for (x = 1; x < 100; x++)
        a[x] == 1 ? printf("%d\n", x) : 0;
#endif

    free(a);

    return 0;
}
