#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int iNo1;
    int iNo2;
    int iAns;

    printf("Enter two number : \t");
    scanf("%d %d", &iNo1, &iNo2);

    iAns = iNo1 * iNo2;

    printf("Multiplication is : %d\n", iAns);

    exit(0);
}