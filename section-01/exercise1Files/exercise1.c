#include <stdio.h>
#include <stdlib.h>

#define SIZE 20


void FizzBuzz(int);
int compare(const void*, const void*);

int main()
{
    printf("Exercise 1:\n");
    printf("Hello, World!\n");

    printf("\nExercise 2:\n");

    int *arr = (int *)malloc(20 * sizeof(int));
    
    for(int i = 0; i < SIZE; i++)
    {
        arr[i] = i+1;
    }

    for(int i = 0; i < SIZE; i++)
    {
        printf("%d: ",arr[i]);
        FizzBuzz(arr[i]);
    }

    printf("\n");

    for(int i = 1; i <= 30; i++)
    {
        printf("%d: ",i);
        FizzBuzz(i);
    }

    printf("\nExercise 3:\n");

    qsort(arr, SIZE, sizeof(int), compare);

    for(int i = 0; i < SIZE; i++)
    {
        printf("%d, ", arr[i]);
    }

    free(arr);

}

void FizzBuzz(int n)
{
    if( n % 3 == 0)
        printf("Fizz");
    if( n % 5 == 0)
        printf("Buzz");
    printf("\n");
}

int compare(const void* a, const void* b)
{
    return *(int*)b - *(int*)a;
}