package main

import (
	"fmt"
)
const LINES int = 10
func ShowYangHuiTriangle(){
    nums := []int{}
    for i := 0; i < LINES; i++ {
        //补空白
        for j := 0; j < (LINES - i); j++ {
            fmt.Print("-")
        }
        for j := 0; j < (i + 1); j++ {
            var length = len(nums)
            var value int
            if j == 0 || j == i {
                value = 1
            } else {
                value = nums[length-i] + nums[length-i-1]
            }
            nums = append(nums, value)
			fmt.Print(value, " ")

		}
		fmt.Printf("len(nums): %d",len(nums))
        fmt.Println("")	
	}

	fmt.Println(nums)
}
func change_arr(arr [] int) (int){
	arr[0] = 100;
	fmt.Println(arr);
	return -1
}
func change_arr1(arr []int) (int){
	arr[0] = 200;
	fmt.Println(arr);
	return -1
}
func main(){
	var arr = [...] int {0,1,2,3,4,5,6,7}
	arr1 := [5] int {10,12,13,14,15}
	fmt.Println(arr,arr1);
	s := arr[:6]
	fmt.Println(s);
	s1 := arr[2:6]
	fmt.Println("---------------");	
	fmt.Println(s1);
	s2 := s1[1:6]
	fmt.Println(s2);

	s3 := s1[0:4]
	fmt.Println(s3);
	s3[2] = 100
	fmt.Println(s3);
	fmt.Println(s1);
	fmt.Println(s2);
	fmt.Println(s);
	fmt.Println(s3);
	//我们可以看到在go语言中数组是数值，使用切片的形式
	//切片的时看的是cap（容量）而不是长度，长度表明了她有多长
	//容量表名它最大能访问到那个数据。
	fmt.Printf("-----len(s3): %d,cap(s3):%d\n",len(s3),cap(s3))
	s4 := s3[4:6]
	fmt.Println(s4);
	fmt.Printf("-----len(s4): %d,cap(s4):%d\n",len(s4),cap(s4))
	ShowYangHuiTriangle()
	fmt.Println("++++++++++++++++++++++++");
	fmt.Println(arr);
	//如果想更改数组中的值，就必须使用切片，将数组传递给使用的函数，如下方式：
	ret := change_arr(arr[:]);
	fmt.Println(arr,ret);
/*
	fmt.Println("------------------");
	fmt.Println(arr);
	ret1 := change_arr(&arr);
	fmt.Println(arr,ret1);
*/
	fmt.Printf("-----len(arr): %d,cap(arr):%d\n",len(arr),cap(arr))
	arr3 := make([]int,len(arr),(cap(arr))*2)
	copy(arr3,s4)
	//copy(arr3,arr[:]) //在copy中必须是切片，如果是元数据的话，可以写成切片的形式
	arr3 = append(arr3,10)
	fmt.Println(arr3);
	fmt.Printf("-----len(arr): %d,cap(arr):%d\n",len(arr3),cap(arr3))


}