package main
import (
	"fmt"
	"os"
)
func main(){
	s,sep := "",""
	//1： 表示取所有的变量
	for _,arg := range os.Args[1:] { //range 是遍历，它会返回两个值，
		//一个是序号，一个是序号所对应的值,序号不需要，所以只用占位符，将其抛弃
		s += sep + arg
		sep = " "
		fmt.Println(s)
	}
	fmt.Println(s)
}
/*
func main(){
	var s,sep string
	for i:=1;i < len(os.Args);i++ {
		s += sep + os.Args[i]
		sep = " "
		fmt.Println(s)
	}
	fmt.Println(s)
}
*/
//print "hello world!"