package main

import (
	"fmt"
	"unicode/utf8"
)

func main() {
	text := "♥"
	fmt.Println("Using len:", len(text)) // Returns: 3

	// This can come as a surprise but actually the text "♥" is represented using 3 bytes
	// since the UTF-8 encoding consists of 3 bytes which is what the len() command uses

	// To count the number of characters instead, use the following:
	fmt.Println("Using utf8 function:", utf8.RuneCountInString(text)) // Returns: 1
}
