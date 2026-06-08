#ifndef MATRIX_H
#define MATRIX_H

typedef struct
{
    int rows;
    int cols;
    int* data;
} matrix_t;

matrix_t create_matrix(int, int);

#endif