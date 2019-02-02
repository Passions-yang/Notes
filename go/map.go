package main

import "fmt"

func main(){
	//创建 map
	var countryCapitalMap map[string]string
	countryCapitalMap = make(map[string]string)

	countryCapitalMap ["france"] = "Paris"
	countryCapitalMap ["Italy"] = "罗马"
	countryCapitalMap ["Janpan"] = "东京"
	countryCapitalMap ["India"] = "新德里"

	for k,v := range countryCapitalMap{
		fmt.Println(k,"首都是",v)
	}
	//原始国家底图
	fmt.Println("---------------原始国家地图-----------");
	for country := range countryCapitalMap{
		fmt.Println(country,"首都是",countryCapitalMap[country])
	}

	//查看元素集合是否存在
	capital,ok := countryCapitalMap["美国"]
	if(ok){
		fmt.Println("美国的国都是",capital)
	}else{
		fmt.Println("美国的国都不存在")
	}

	//删除元素
	fmt.Println("---------------删除Italy-----------");
	delete(countryCapitalMap,"Italy")
	for country := range countryCapitalMap{
		fmt.Println(country,"首都是",countryCapitalMap[country])
	}
	
}

