package main

import "fmt"

func euler(n int) int {
	var sum int

	for i := 0; i < n; i++ {
		if i%3 == 0 || i%5 == 0 {
			sum += i
		}
	}

	return sum
}

func main() {
	fmt.Println(euler(10))
}
