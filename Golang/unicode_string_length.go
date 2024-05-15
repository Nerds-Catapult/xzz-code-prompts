/*
When working with strings in Go, it's important to understand that len() returns the number of bytes in the string,
not the number of characters. This behavior can be surprising when dealing with multibyte characters in UTF-8 encoding.

In the example below, we have a string "♥" which represents a single character, the heart symbol. However, when we use len(),
it returns 3 instead of 1. This occurs because the UTF-8 encoding of the heart symbol consists of 3 bytes.

To correctly count the number of characters in a UTF-8 encoded string, use the utf8.RuneCountInString() function.
This function returns the number of Unicode code points (runes) in the string, which corresponds to the number of characters.

By using utf8.RuneCountInString() instead of len(), we get the expected result of 1 for the number of characters in the string "♥".
*/
package main

import (
	"fmt"
	"unicode/utf8"
)

func main() {
	text := "♥"
	fmt.Println("Using len:", len(text))                              // Returns: 3
	fmt.Println("Using utf8 function:", utf8.RuneCountInString(text)) // Returns: 1
}
