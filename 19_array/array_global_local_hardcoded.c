#include <stdio.h>
#include <stdlib.h>

int g_arr[] = {10, 20, 30};

int main(void)
{
    int arr[] = {40, 50, 60};

    printf("%d\n", g_arr[2]);
    printf("%d\n", arr[2]);

    exit(0);
}