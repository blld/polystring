
import os
from polystring import *

if os.getenv('LANG') :
	Polystring.identifier = os.getenv('LANG')

# Usage

greetings = Polystring("fr\\Bonjour\0  it\\Ciao\0  Hello")

print("{} -- {}".format(greetings, Polystring.identifier))
print(greetings.to("fr"))
print(greetings.to("it"))
print(greetings.to("en"))

print("raw: {}".format(greetings.raw))
