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

package Polystring

import (
	"strings"
)

var Identifier = "en_US"

type Polystring struct {
	Raw string
}

func New(raw string) *Polystring {
	self := new(Polystring)
	self.Raw = raw
	return self
}

func (self *Polystring) String() string {
	return self.Locale()
}

func (self *Polystring) Locale() string {
	return self.To(Identifier)
}

func (self *Polystring) To(target string) string {
	text := self.Raw[:]
	for {
		separator := strings.Index(text, "\\")
		if separator < 0 {
			return text
		}
		end := strings.Index(text, "\x00")
		if text[:separator] == target[:separator] {
			return text[separator + 1: end]
		}
		text = text[end + 1:]
		for text[0] == ' ' {
			text = text[1:]
		}
	}
}
