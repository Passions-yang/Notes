package main

import "fmt"

func main(){
	nums := [] int {1,2,3,4}
	sum := 0
	for i,num := range nums{
		sum += num
		fmt.Println(i,num,sum)
	}
	fmt.Println("sum : ",sum)

	//map[key] value
	kvs := map[int]string {25:"apple",32:"banana"}
	//	kvs := map[string]string {"a":"apple","b":"banana"}
	for k,v := range kvs{
		fmt.Printf("%d -> %s\n",k,v)
	}
	for i,c := range "go" {
		fmt.Println(i,c)
	}
}