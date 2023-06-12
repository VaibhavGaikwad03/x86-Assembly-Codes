#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int numerator;
    int denominator;
    int remainder;

    printf("Enter numberator : \t");
    scanf("%d", &numerator);

    printf("Enter denominator : \t");
    scanf("%d", &denominator);

    remainder = numerator % denominator;

    printf("Quotient is : %d\n", numerator / denominator);
    printf("Remainder is : %d\n", remainder);

    exit(0);
}