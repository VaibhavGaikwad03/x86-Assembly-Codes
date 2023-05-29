#include <stdio.h>

int addition(int iNo1, int iNo2)
{
    return iNo1 + iNo2;
}

int main(void)
{
    int iNo1, iNo2, iRet;

    printf("Enter two number : \n");
    scanf("%d %d", &iNo1, &iNo2);

    iRet = addition(iNo1, iNo2);

    printf("Answer is : %d\n", iRet);

    return 0;
}