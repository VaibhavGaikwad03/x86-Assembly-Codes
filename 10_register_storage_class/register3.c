#include <stdio.h>
#include <stdlib.h>

void fun1();
void fun2();

int main(void)
{
    register int iNo = 10;

    printf("iNo is : %d\n", iNo);

    fun1();

    printf("iNo is : %d\n", iNo);

    exit(0);
}

void fun1(void)
{
    register int iNo = 20;

    printf("fun1 iNo is : %d\n", iNo);

    fun2();
}

void fun2(void)
{
    register int iNo = 30;

    printf("fun2 iNo is : %d\n", iNo);
}