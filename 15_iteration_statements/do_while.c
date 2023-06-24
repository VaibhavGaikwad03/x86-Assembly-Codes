#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int iNo;
    int iCounter;

    printf("Enter number : \t");
    scanf("%d", &iNo);
    iCounter = 0;

    do
    {
        printf("%d\n", iCounter);
        iCounter++;

    }while(iCounter < iNo);

    exit(0);
}