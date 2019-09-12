package main

import "fmt"

func main() {
	fmt.Println("vim-go")
	_, _ = bar()
}

func bar() ([]int, error) {
	nums := []int{1, 2, 3}
	return nums[1:len(nums)], nil
}
