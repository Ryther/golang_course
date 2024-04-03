package main

import "fmt"

var a string = "v1"

const b bool = true

func main() {
	c := 42
	fmt.Printf("The value of a is \"%[1]v\" and its type is \"%[1]T\"\n", a)
	fmt.Printf("The value of b is \"%[1]v\" and its type is \"%[1]T\"\n", b)
	fmt.Printf("The value of c is \"%[1]v\" and its type is \"%[1]T\"\n", c)
}
