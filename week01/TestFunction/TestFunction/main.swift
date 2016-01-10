//
//  main.swift
//  TestFunction
//
//  Created by gaokunpeng on 15/11/20.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation

print("Hello, World!")

//函数的使用
//1、没有返回值，没有参数的函数
//func表示是一个函数
func myFunc1(){
    print("没有返回值，没有参数的函数")
}

//函数的调用
myFunc1()

//有一个参数的
//age是形参名
//Int是参数类型
func myFunc2(age: Int){
    print("age=\(age)")
}

//有一个参数，参数是String类型
func myFunc3(name: String){
    print(name)
}

//两个参数
func myFunc4(name:String, age:Int){
    print("\(name)的年龄是\(age)")
}
myFunc4("张三", age: 30)

//有返回值的函数
//用->加类型表示返回值
func myFunc5(age: Int) -> Int {
   return age
}
let age = myFunc5(100)
print(age)

//返回字符串
func myFunc6(name: String,age: Int) -> String{
    return "\(name)今年\(age)岁"
}
let ret = myFunc6("习大大", age: 70)
print(ret)

//参数是数组
//计算数组里面所有元素之和
func myFunc7(arr: [Int]) -> Int{
    //返回数组所有元素之和
    var sum = 0
    for i in arr {
        sum += i
    }
    return sum
}
var arr = [1,2,3,4]
let ret2 = myFunc7(arr)
print(ret2)

//返回多个值
//返回数组里面的最大值，最小值，所有元素之和
func statistic(arr: [Int]) -> (min:Int,max:Int,sum:Int) {
    
    var min = arr[0]
    var max = arr[0]
    var sum = 0
    for value in arr {
        if value > max {
            max = value
        }else if value < min {
            min = value
        }
        //求和
        sum += value
    }
    return (min,max,sum)
}

let sRet = statistic(arr)
print("min= \(sRet.min)")
print("max= \(sRet.max)")
print("sum= \(sRet.sum)")

//函数的参数是可变个参数
func varFunc(ages: Int...){
    for i in ages {
        print("\(i)")
    }
}
//调用函数
varFunc(1)
varFunc()
varFunc(1,2)
varFunc(1,2,3)

//返回值是一个函数
func retFunc() -> (Int -> Int){
    func inFunc(age: Int) -> Int{
        return age
    }
    return inFunc
}
let funcRet = retFunc()
let age3 =  funcRet(10)
print(age3)










