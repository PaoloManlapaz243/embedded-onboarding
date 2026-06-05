#include "matrix.h"
#include <stdlib.h>

matrix_t create_matrix(int rows, int cols)
{
    matrix_t m;
    m.rows = rows;
    m.cols = cols;
    m.data = malloc(cols * rows * sizeof(int));

    return m;
}