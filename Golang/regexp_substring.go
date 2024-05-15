/*
Go's regexp.MatchString function can produce unexpected results if not used with the appropriate pattern.
In the example below, we use regexp.MatchString to check if a string contains only digits.
We expect the first call to return false since the string "12three45" contains digits, but it actually returns true.
This happens because regexp.MatchString checks for substrings by default. Thus, it finds digits within the string,
even though there are non-digit characters present.

To ensure that the pattern matches the entire string, we need to anchor the pattern using '^' and '$'.
'^' matches the beginning of the string, and '$' matches the end of the string.
By enclosing the pattern with '^' and '$', we specify that the pattern must match the entire string, not just a substring.

After modifying the pattern to include '^' and '$', the second call to regexp.MatchString returns false,
which is the expected result since the entire string "12three45" contains non-digit characters.

To summarize, when using regexp.MatchString to match the entire string, always anchor the pattern with '^' and '$'
to ensure that it doesn't match substrings.
*/
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
	fmt.Println("Found match:", matched) // Returns true which is wrong

	// After anchoring the pattern
	matched, err = regexp.MatchString(`^[0-9]*$`, "12three45")
	if err != nil {
		panic(err)
	}

	fmt.Println("Found match:", matched) // Returns false
}
