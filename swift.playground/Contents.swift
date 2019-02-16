
// Usage (see Polystring.playground/Sources/Polystring.swift for implementation)

import Foundation 

let greetings = Polystring("fr\\Bonjour\0  it\\Ciao\0  Hello")

print(greetings, "--", Polystring.identifier)
print(greetings.to("fr_FR"))
print(greetings.to("it_IT"))
print(greetings.to("en_US"))

print("raw:", greetings.raw)
