package main

import (
	"fmt"
	"time"
)

func main() {
	data := []string{"one", "two", "three"}

	for _, v := range data {
		go func() {
			fmt.Println(v)
		}()
	}

	time.Sleep(3 * time.Second)

	// If using Go version 1.21 and below,
	// The goroutines will print: three, three, three

	// Easiest way to solve this is to pass the
	// variable in the go function

	for _, v := range data {
		go func(v string) { // <- here
			fmt.Println(v)
		}(v) // <- and here
	}

	time.Sleep(3 * time.Second)
}
