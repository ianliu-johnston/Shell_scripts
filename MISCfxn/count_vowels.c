#include <stdio.h>

int count_vowels(char *s)
{
	int i, count;
	char vowels[5] = "aeiou";
	
	i = count = 0;
	if (*s == '\0')
		return (i);
	while (vowels[count])
	{
		if (*s == vowels[count])
			i++;
		printf("i = %d\n", i);
	}
	count_vowels(s++);
}
