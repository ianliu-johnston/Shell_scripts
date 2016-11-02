#include <stdio.h>
#include "prototypes.h"

int main(void)
{
	int i, max;

	max = 14;
	for (i = 1; i <= max; i++)
	{
		printf(" %d = %d",i, sum_nums(i));
		if (i == max)
			putchar('\n');
		else
			printf(" +");
	}
	return (0);
}
