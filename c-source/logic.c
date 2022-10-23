#include <stdio.h>

int logic_and_print(int *A, int*B, int n) {
    int pos, neg, ib, i;
    
    pos = -1;
    neg = -1;

    for (i = 0; i < n; ++i) {
        if (A[i] < 0) {
            neg = i;
        }
        if (A[i] > 0 && pos == -1) {
            pos = i;
        }
    }

    ib = 0;
    for (i = 0; i < n; ++i) {
        if (i != neg && i != pos) {
            B[ib] = A[i];
            ++ib;
        }   
    }
    return ib;
}
