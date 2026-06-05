#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#include "matrix.h"

const int row = 10000;
const int col = 10000;

matrix_t matrix_transpose(matrix_t);
int matrix_transpose_pt(const matrix_t*, matrix_t*);
matrix_t matrix_printf(matrix_t);

int main()
{
    matrix_t m = create_matrix(row, col);

    for(int i = 0; i < m.rows; i++)
    {
        for(int j = 0; j < m.cols; j++)
        {
            m.data[i * m.cols + j] = rand();
        }
    }

    clock_t start = clock();
    matrix_t mt = matrix_transpose(m);
    clock_t end = clock();

    clock_t start_pt = clock();
    matrix_t mt2 = create_matrix(m.cols, m.rows);
    matrix_transpose_pt(&m, &mt2);
    clock_t end_pt = clock();


    //matrix_printf(m);
    //matrix_printf(mt);
    //matrix_printf(mt2);

    double time_spent = (double)(end - start) / CLOCKS_PER_SEC;
    printf("Execution time: %f seconds\n", time_spent);

    time_spent = (double)(end_pt - start_pt) / CLOCKS_PER_SEC;
    printf("Execution time pt: %f seconds\n", time_spent);


    free(m.data);
    m.data = NULL;

    free(mt.data);
    mt.data = NULL;

    free(mt2.data);
    mt2.data = NULL;
}

matrix_t matrix_transpose(matrix_t m) {
    matrix_t mt = create_matrix(m.cols, m.rows);

    for (int i = 0; i < m.rows; ++i)
    {
        for (int j = 0; j < m.cols; ++j)
        {
            mt.data[j * m.rows + i] = m.data[i * m.cols + j];
        }
    }

    return mt;
}

int matrix_transpose_pt(const matrix_t *m, matrix_t *mt) {

    if(m == NULL)
    {
        mt = NULL;
        return -1;
    }

    int rows = m->rows;
    int cols = m->cols;

    for (int i = 0; i < rows; i++)
    {
        for (int j = 0; j < cols; j++)
        {
            mt->data[j * rows + i] = m->data[i * cols + j];
        }
    }

    return 0;
}

matrix_t matrix_printf(matrix_t m)
{
    for(int i = 0; i < m.rows; i++)
    {
        for(int j = 0; j < m.cols; j++)
        {
            printf("[%i]", m.data[i * m.cols + j]);
        }
        printf("\n");
    }
}