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

"use strict"

function Polystring(raw) {
	if (!this)
		return new Polystring(raw)
	
	Object.defineProperty(this, "raw", { value: raw })
}
Polystring.identifier = "en_US"

Object.defineProperties(Polystring.prototype, {
	
	raw: { value: "" },
	
	locale: { get: function() {
		return this.toLocaleString()
	}},
	
	toString: { value: function() {
		return this.to(Polystring.identifier)
	}},
	
	to: { value: function(target) {
		var text = this.raw
		for (;;) {
			var sep = text.indexOf('\\')
			if (sep < 0)
				return text
			
			var end = text.indexOf('\0')
			if (text.substring(0, sep) == target.substring(0, sep))
				return text.substring(sep + 1, end)
			
			text = text.substring(end + 1)
			while (text[0] == ' ')
				text = text.substring(1)
		}
	}},
	
})
