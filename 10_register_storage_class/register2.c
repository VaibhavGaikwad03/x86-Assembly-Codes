#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    register int iNo1 = 10;
    register int iNo2 = 20;
    register int iNo3 = 30;
    register int iNo4 = 40;
    register int iNo5 = 50;

    printf("%d\n", iNo1);
    printf("%d\n", iNo2);
    printf("%d\n", iNo3);
    printf("%d\n", iNo4);
    printf("%d\n", iNo5);

    exit(0);
}