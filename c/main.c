
#include <stdlib.h>
#include <stdio.h>

#include "polystring.h"

int main(int argc, char *argv[])
{
	if (getenv("LANG")) {
		Polystring.identifier = getenv("LANG");
	}
	
	// Usage
	
	static const char greetings[] = "fr\\Bonjour\0  it\\Ciao\0  Hello";
	
	printf("%s -- %s\n", Polystring.locale(greetings), Polystring.identifier);
	puts(Polystring.to(greetings, "fr_FR"));
	puts(Polystring.to(greetings, "it_IT"));
	puts(Polystring.to(greetings, "en_US"));
	
	{
		int i, c;
		printf("raw: ");
		for (i = 0, c = sizeof(greetings)-1; i < c; ++i) {
			if (greetings[i] != '\0')
				putchar(greetings[i]);
		}
		putchar('\n');
	}
	return EXIT_SUCCESS;
}

