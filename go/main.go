package main

import (
	"os"
	"fmt"
	"./polystring"
)

func main() {
	if (os.Getenv("LANG") != "") {
		Polystring.Identifier = os.Getenv("LANG")
	}
	
	// Usage (\0 is \x00 in Go)
	
	greetings := Polystring.New("fr\\Bonjour\x00  it\\Ciao\x00  Hello")
	
	fmt.Println(greetings, "--", Polystring.Identifier)
	fmt.Println(greetings.To("fr"))
	fmt.Println(greetings.To("it"))
	fmt.Println(greetings.To("en"))
	
	fmt.Println("raw:", greetings.Raw)
}
