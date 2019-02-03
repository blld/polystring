/*
Copyright (c) 2019 Aurélien Bouilland

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

#include <string.h>

#include "polystring.h"

static
const char *polystring_locale(const char *text)
{
	return Polystring.to(text, Polystring.identifier);
}

static
const char *polystring_to(const char *text, const char *target)
{
	for (;;)
	{
		const char *separator = strchr(text, '\\');
		if (!separator)
			return text;
		
		if (!memcmp(text, target, separator - text))
			return separator + 1;
		
		text += strlen(text) + 1;
		while (*text == ' ')
			++text;
	}
}

struct Polystring Polystring = {
	"en_US",
	polystring_locale,
	polystring_to
};
