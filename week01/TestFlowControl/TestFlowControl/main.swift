//
//  main.swift
//  TestFlowControl
//
//  Created by gaokunpeng on 15/11/20.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation

print("Hello, World!")

//流程控制

//一、顺序

//二、选择
//if
//if判断条件的括号可以省略
//后面的大括号不能省略
var flag = true
if flag {
    print("true")
}else{
    print("flag")
}

var flag2 = 3 > 2
var flag3 = 3 == 2
if flag2 {
    print("3>2")
}else if(flag3){
    print("3==2")
}else{
    print("3<2")
}

//三、循环
//计算1到10累加
//1)for循环
var sum1 = 0
for var i=0;i<=10;i++ {
    sum1 += i
}
print(sum1)

//区间
//...表示闭区间
var sum2 = 0
for var i in 1...10 {
    sum2 += i
}
print(sum2)

//..<表示只包含左边值，不包含右边值
var sum3 = 0
for i in 1..<11 {
    sum3 += i
}
print(sum3)

//2)while循环
var sum4 = 0
var i = 0
while i <= 10 {
    sum4 += i
    i++
}
print(sum4)

//3)repeat...while...
var sum5 = 0
var j = 0
repeat {
    sum5 += j
    j++
} while j <= 10
print("sum5=\(sum5)")

//switch...case
//1)swift里面switch语句除了可以是枚举类型，之外，还可以是其他类型，例如字符串
//2)swift的switch语句必须写上default语句块
//3)swift的switch的case语句后面不需要加break语句
let fruit = "apple"
switch fruit {
    case "banana":
        print("banana")
    case "apple":
        print("apple")
    default:
        print("other fruit")
}








