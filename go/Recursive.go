package main

import "fmt"

func factorial(n uint64)(result uint64){
	if(n > 0){
		result = n * factorial(n-1)
		return result
	}
	return 1
}
func fibonacci(n int)int {
	if(n < 2){
		return n;
	}
	return fibonacci(n - 2) + fibonacci(n - 1)
}
func main(){
	var n int = 15
	fmt.Printf("%d 的阶乘是 %d\n",n,factorial(uint64 (n)))
	var i int = 0
	for i = 0;i < 10; i++{
		fmt.Printf("%d\t",fibonacci(i))
	}
}