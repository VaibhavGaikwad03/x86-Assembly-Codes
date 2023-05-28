#include <stdio.h>
#include <stdlib.h>

void fun();	//declaration

int main(void)
{
	extern int g_iNo;
	printf("In main, g_iNo is %d\n", g_iNo);

	fun();

	exit(0);
}
