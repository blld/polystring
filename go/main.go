package main

import (
	"os"
	"fmt"
	"./polystring"
)

func main() {
	Polystring.Identifier = os.Getenv("LANG")
	
	// Usage
	// Note: \0 is not supported in Go and must be replaced by \x00
	
	greetings := Polystring.New("fr\\Bonjour\x00  it\\Ciao\x00  Hello")
	
	fmt.Println(greetings, "--", Polystring.Identifier)
	fmt.Println(greetings.To("fr"))
	fmt.Println(greetings.To("it"))
	fmt.Println(greetings.To("en"))
	
	fmt.Println("raw:", greetings.Raw)
}
