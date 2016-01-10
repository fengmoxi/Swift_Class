//
//  main.swift
//  TestOperator
//
//  Created by gaokunpeng on 15/11/20.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation

print("Hello, World!")

//运算符
//1、赋值
var i = 2
//2、算术运算符
var a = 10
var b = 2
//加法
var c = a + b
print("a+b=\(c)")
//减法
var d = a - b
print("a-b= \(d)")
//乘法
var e = a * b
print("a*b=\(e)")
//除法
var f = a / b
print("a/b = \(f)")

//3、比较运算符
//> < ==
var ret = a > b
print(ret)

var ret2 = a < b
print(ret2)

var ret3 = a == b
print(ret3)

//4、三目运算符
var ret4 = a>b ? "a>b" : "a不大于b"
print(ret4)

//5、区间运算符
// [2,4)    2..<4
// [1,10]   1...10


//6、逻辑运算符
//&& || 
var boolVal1 = true
var boolVal2 = false
var boolRet1 = boolVal1 && boolVal2
print(boolRet1)
var boolRet2 = boolVal1 || boolVal2
print(boolRet2)





