/*
 * sum_nums - returns summation of numbers i + 2 + 3 + .. n
 * @n: max number
 * Return: factorial function call until 0 is reached. 
 */
unsigned int sum_nums(unsigned int n)
{
	if (n <= 0)
		return (0);
	return (n + sum_nums(n - 1));
}
