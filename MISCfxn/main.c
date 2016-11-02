#include <stdio.h>
#include "prototypes.h"

int main(void)
{
	int n;

	n = 44812; /* = 17*/
	printf("%d\n", add_digits_iter(n));
	printf("%d\n", add_digits_recur(n));
	return (0);
}
