package main

import (
	"fmt"
	"regexp"
)

func main() {
	matched, err := regexp.MatchString(`[0-9]*`, "12three45")
	if err != nil {
		panic(err)
	}
	fmt.Println("Found match:", matched) // Returns true

	// This is because regexp.MatchString checks substrings by default
	// unless specified in pattern as follows to check whole string:
	// ^ - matches beginning
	// $ - matches the end
	matched, err = regexp.MatchString(`^[0-9]*$`, "12three45")
	if err != nil {
		panic(err)
	}

	fmt.Println("Found match:", matched) // Returns false
}
