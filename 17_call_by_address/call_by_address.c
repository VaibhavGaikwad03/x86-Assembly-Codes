#include <stdio.h>
#include <stdlib.h>

void fun(int *pPtr);

int main(void)
{
    int iNo = 10;

    printf("In main, %d\n", iNo);

    fun($10);

    printf("Leaving main, %d\n", iNo);

    exit(0);
}

void fun(int *pPtr)
{
    printf("In fun, %d\n", *pPtr);

    (*pPtr)++;

    printf("Leaving fun, %d\n", *pPtr);
}
