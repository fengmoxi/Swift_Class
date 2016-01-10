//
//  main.swift
//  FirstSwiftProject
//
//  Created by gaokunpeng on 15/11/20.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation

print("Hello, World!")

//一、常量和变量的使用
//1.常量
//i是常量名，1是常量值
let i = 1
//常量赋值之后不能更改
//i = 2  //这样是错误的
//打印常量值
print(i)

//2.变量(var)
//j是变量名,10是变量值
var j = 10
//修改变量值
j = 20
print(j)

//二、swift基本数据类型
//1、整型
//swift里面可以不明确声明类型，赋值之后编译器可以自动判断类型
var k = 10
//也可以指定类型
var m: Int
//赋值
m = 20
//Int16 Int32 Int64

//2、浮点
var myFloat: Float = 32.0
var myDouble: Double = 30.0

//3、布尔类型
//true表示真,false表示假
var myBool: Bool = true
var anotherBool: Bool = false
print(myBool)
print(myDouble)

//4、字符串
var str: String = "hello,swift"
print(str)





