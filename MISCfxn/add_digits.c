#include <stdio.h>

unsigned int add_digits_iter(unsigned int n)
{
	unsigned int i = 1;
	int sum = 0;
	
	while (i <= n)
	{
		sum += n % 10;
		printf("n: %d, sum %d\n", n, sum);
		n /= 10;
	}
	return (sum);
}

unsigned int add_digits_recur(unsigned int n)
{
	printf("recursion %d", n);
	if (n < 1)
		return (0);
	printf(" n%%10 = %d, n/10 = %d\n", n % 10, n / 10);
	return (n % 10 + add_digits_recur(n/10));
}
