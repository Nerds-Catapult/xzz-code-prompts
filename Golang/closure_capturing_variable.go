/*
Go has a closure capturing variable gotcha that can lead to unexpected behavior when using goroutines.
In the example below, we iterate over a slice of strings and launch goroutines within a loop to print each string.
The closure created by the goroutine captures the loop variable 'v', but due to how closures work in Go, all goroutines
may end up sharing the same 'v' variable, leading to all goroutines printing the last value assigned to 'v'.

To address this issue, we can pass the loop variable as an argument to the goroutine function.
This ensures that each goroutine receives its own copy of the loop variable, preventing the unintended sharing.
By passing 'v' as an argument when launching the goroutine, each goroutine operates on its own copy of 'v',
resulting in the expected behavior of printing each string in the slice.

If using Go version 1.21 and below, the goroutines without passing 'v' as an argument will print the last value of 'v' for all iterations.
To solve this, ensure each goroutine receives its own copy of the loop variable by passing it as an argument as demonstrated below.
*/
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
	// variable in the go function as follows:

	for _, v := range data {
		go func(v string) { // <- here
			fmt.Println(v)
		}(v) // <- and here
	}

	time.Sleep(3 * time.Second)
}
