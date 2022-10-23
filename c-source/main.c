#include <stdio.h>
#include <stdlib.h>

extern int logic_and_print(int *A, int *B, int n);

int main(int argc, char *argv[]) {

    int n, i, ib;

    if (argc == 2) {
        n = atoi(argv[1]);
        FILE *input = fopen("input.txt", "r");
        int A[n];
        int B[n];

        for (int i = 0; i < n; ++i) {
            fscanf(input, "%d", &A[i]);
        }
        fclose(input);

        ib = logic_and_print(A, B, n);

        FILE *output = fopen("output.txt", "w");
        for (int i = 0; i < ib; ++i) {
            fprintf(output, "%d ", B[i]);
        }
        fclose(output);

        return 0;
    }

    scanf("%d", &n);

    int A[n];
    int B[n];

    for (i = 0; i < n; ++i) {
        scanf("%d", &A[i]);
    }

    ib = logic_and_print(A, B, n);
    for (i = 0; i < ib; ++i) {
        printf("%d ", B[i]);
    }
    
    return 0;
}
