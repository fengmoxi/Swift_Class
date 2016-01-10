//
//  main.swift
//  TestString
//
//  Created by gaokunpeng on 15/11/20.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation

print("Hello, World!")

//字符串的使用
//1、创建字符串
//1)swift的结构体字符串
var swiftStr1 = "hello"
print(swiftStr1)

var swiftStr2 = String(stringInterpolation: "another")
print(swiftStr2)
//2)类的字符串
//用一个String字符串初始化NSString字符串
var nsStr1 = NSString(string: swiftStr1)
print(nsStr1)

var nsStr2 = NSString(format: nsStr1, "123")
print(nsStr2)

//类的字符串转化成结构体的字符串
//as表示类型转换
var swiftStr3 = nsStr1 as String
print(swiftStr3)


//2、字符串的方法
//1)字符串的长度
//结构体字符串
print(swiftStr1.characters.count)
//类的字符串
print(nsStr1.length)

//2)Int转换成字符串
//结构体
let i = 10
var swiftStr4 = String(i)
print(swiftStr4)

//类
var nsStr4 = NSString(format: "%d", i)
print(nsStr4)


//3)字符串的拼接
//结构体(String)
var aStr = "hello"
var bStr = "world"
var rStr = aStr + bStr
print(rStr)

//类NSString:是不可变,NSMutableString
var nsMutableStr1 = NSMutableString(string: "123")
var nsStr6 = "456"
nsMutableStr1.appendString(nsStr6)
print(nsMutableStr1)

//4)截取子字符串
//结构体
var spStr = "hello,swift"
var ret = spStr.substringFromIndex(spStr.startIndex)
print(ret)
//spStr.startIndex获取第一个序号
//successor()获取后面一个序号
var ret2 = spStr.substringFromIndex(spStr.startIndex.successor())
print(ret2)
//spStr.endIndex表示最后一个位置
//predecessor()表示向前一个位置
var ret3 = spStr.substringToIndex(spStr.endIndex.predecessor())
print(ret3)

//类(NSString)
var spnsStr: NSString = "nihaoshanghai"
var nsRet1 = spnsStr.substringFromIndex(3)
print(nsRet1)

var nsRet2 = spnsStr.substringToIndex(8)
print(nsRet2)
//NSRange
let range = spnsStr.rangeOfString("shang")
var nsRet3 = spnsStr.substringWithRange(range)
print(nsRet3)

//5)分割字符串
//结构体(String)
var splitStr = "hello;world;nihao"
let arr = splitStr.componentsSeparatedByString(";")
print(arr)

//类(NSString)
var splitnsStr: NSString = "hello;nihao;shanghai"
let arr2 = splitnsStr.componentsSeparatedByString(";")
print(arr2)

//字符集
let cSet = NSCharacterSet(charactersInString: ",;.")
var splitnsStr2: NSString = "hello,world;123.456"
let arr3 = splitnsStr2.componentsSeparatedByCharactersInSet(cSet)
print(arr3)








