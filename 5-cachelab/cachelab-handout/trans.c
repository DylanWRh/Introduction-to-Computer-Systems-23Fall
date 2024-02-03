/*
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */
#include <stdio.h>
#include "cachelab.h"
#include "contracts.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/*
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. The REQUIRES and ENSURES from 15-122 are included
 *     for your convenience. They can be removed if you like.
 */
void trans(int M, int N, int A[N][M], int B[M][N]);
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    REQUIRES(M > 0);
    REQUIRES(N > 0);

    int i, j, p, q;     // loop variables
    int v0, v1, v2, v3, v4, v5, v6, v7;     // temp variables

    if (N == 32) {
        // Case 32 x 32, divide the matrix into 8 x 8 blocks
        for (i = 0; i < N; i += 8) {
            for (j = 0; j < M; j += 8) {
                for (p = 0; p < 8; ++p) {
                    // read A only, spatial locality
                    v0 = A[i + p][j + 0];
                    v1 = A[i + p][j + 1];
                    v2 = A[i + p][j + 2];
                    v3 = A[i + p][j + 3];
                    v4 = A[i + p][j + 4];
                    v5 = A[i + p][j + 5];
                    v6 = A[i + p][j + 6];
                    v7 = A[i + p][j + 7];
                    // write B only, spatial locality
                    B[j + p][i + 0] = v0;
                    B[j + p][i + 1] = v1;
                    B[j + p][i + 2] = v2;
                    B[j + p][i + 3] = v3;
                    B[j + p][i + 4] = v4;
                    B[j + p][i + 5] = v5;
                    B[j + p][i + 6] = v6;
                    B[j + p][i + 7] = v7;
                }
                // now cache are all B's elements
                for (p = 0; p < 8; ++p) {
                    for (q = p + 1; q < 8; ++q) {
                        v0 = B[j + q][i + p];
                        B[j + q][i + p] = B[j + p][i + q];
                        B[j + p][i + q] = v0;
                    }
                }
            }
        }
    } else if (N == 64) {
        // Case 64 x 64, for each 8 x 8 block, divide it into 4 x 4 pieces
        /* Main idea
         *     A                 B                   B                   B
         * | 1 | 2 |       |     |     |       | 1^T |     |       | 1^T | 3^T |
         * ---------  -->  -------------  -->  -------------  -->  -------------  
         * | 3 | 4 |       | 2^T | 1^T |       | 2^T | 4^T |       | 2^T | 4^T |
         */
         for (i = 0; i < N; i += 8) {
            for (j = 0; j < M; j += 8) {
                // Step 1. Copy and transpose 1 and 2 
                // Use spatial locality of A
                for (p = 0; p < 4; ++p) {
                    v0 = A[i + p][j + 0];
                    v1 = A[i + p][j + 1];
                    v2 = A[i + p][j + 2];
                    v3 = A[i + p][j + 3];
                    v4 = A[i + p][j + 4];
                    v5 = A[i + p][j + 5];
                    v6 = A[i + p][j + 6];
                    v7 = A[i + p][j + 7];

                    B[j + 0 + 4][i + p + 4] = v0;
                    B[j + 1 + 4][i + p + 4] = v1;
                    B[j + 2 + 4][i + p + 4] = v2;
                    B[j + 3 + 4][i + p + 4] = v3;
                    B[j + 0 + 4][i + p] = v4;
                    B[j + 1 + 4][i + p] = v5;
                    B[j + 2 + 4][i + p] = v6;
                    B[j + 3 + 4][i + p] = v7;
                }
                // Step 2. Copy and transpose 4 while copy 1^T
                // Use spatial locality of B
                for (q = 0; q < 4; ++q) {
                    v0 = A[i + 4][j + q + 4];
                    v1 = A[i + 5][j + q + 4];
                    v2 = A[i + 6][j + q + 4];
                    v3 = A[i + 7][j + q + 4];
                    v4 = B[j + q + 4][i + 4];
                    v5 = B[j + q + 4][i + 5];
                    v6 = B[j + q + 4][i + 6];
                    v7 = B[j + q + 4][i + 7];

                    B[j + q + 4][i + 4] = v0;
                    B[j + q + 4][i + 5] = v1;
                    B[j + q + 4][i + 6] = v2;
                    B[j + q + 4][i + 7] = v3;
                    B[j + q][i + 4 - 4] = v4;
                    B[j + q][i + 5 - 4] = v5;
                    B[j + q][i + 6 - 4] = v6;
                    B[j + q][i + 7 - 4] = v7;
                }
                // Step 3. Copy and transpose 3
                // Use spatial locality of A
                for (p = 4; p < 8; ++p) {
                    v4 = A[i + p][j + 0];
                    v5 = A[i + p][j + 1];
                    v6 = A[i + p][j + 2];
                    v7 = A[i + p][j + 3];
                    B[j + 0][i + p] = v4;
                    B[j + 1][i + p] = v5;
                    B[j + 2][i + p] = v6;
                    B[j + 3][i + p] = v7;
                }
            }
         }

    } else if (N == 68) {
        // Case 60 x 68, divided into 24 x 4 blocks (magic number)
        // For each 24 x 4, divide into 4 x 2 sub-blocks
        for (i = 0; i < N; i += 24) {
            for (j = 0; j < M; j += 4) {
                for (p = i; p < N && p < i + 24; p += 2)  {
                    v0 = A[p + 0][j + 0];
                    v1 = A[p + 0][j + 1];
                    v2 = A[p + 0][j + 2];
                    v3 = A[p + 0][j + 3];
                    v4 = A[p + 1][j + 0];
                    v5 = A[p + 1][j + 1];
                    v6 = A[p + 1][j + 2];
                    v7 = A[p + 1][j + 3];
                    B[j + 0][p + 0] = v0;
                    B[j + 1][p + 0] = v1;
                    B[j + 2][p + 0] = v2;
                    B[j + 3][p + 0] = v3;
                    B[j + 0][p + 1] = v4;
                    B[j + 1][p + 1] = v5;
                    B[j + 2][p + 1] = v6;
                    B[j + 3][p + 1] = v7;
                }
            }
        }
    } else {
        trans(M, N, A, B);
    }

    ENSURES(is_transpose(M, N, A, B));
}

/*
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started.
 */

 /*
  * trans - A simple baseline transpose function, not optimized for the cache.
  */
char trans_desc[] = "Simple r-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    REQUIRES(M > 0);
    REQUIRES(N > 0);

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }

    ENSURES(is_transpose(M, N, A, B));
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc);

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc);

}

/*
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

