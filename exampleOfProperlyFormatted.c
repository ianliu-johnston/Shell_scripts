#include <stdio.h>
/** 
 * main - takes a character and integer and prints them out to stdout
(* 
 * Description: Uses scanf and printf to print user input to stdout.
 * Return: return success.
 */
int main(void)
{
	char c;
	int i;
	
	printf("Print out a character and a number, separated by a space.\n");
	scanf("%c %d", &c, &i);
	printf("who: %c size: %d\n", c,i);
	return(0);
}
