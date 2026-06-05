# Exercise 2

Given code block

``` c
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
```


The two issues I saw were that the original and transposed matrix were passed by value and that there were no error handling/flags. The first issue forces the program to create a copy of the original matrix when called, and a copy of the transposed matrix when returned. The second issue means that the program doesn't have a descriptive way of indicating to the user if the matrix transpose function worked properly.

As far as matrix transposition perforamance optimization, I don't see a viable change other than potentially splitting operating of the loop further to reduce memory stride and make the most of the L1 cache.



Optimized Code block:
``` c
void matrix_transpose_pt(const matrix_t *m, matrix_t *mt) {

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

    return 0
}
```