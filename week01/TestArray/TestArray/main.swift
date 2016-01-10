//
//  main.swift
//  TestArray
//
//  Created by gaokunpeng on 15/11/20.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation

print("Hello, World!")

//数组的使用
//1、数组的创建
//swift
var arr1 = [1,2,3]
//Array是swift数组的类型
//<String>表示数组里面存储的是字符串
var arr2: Array<String> = ["1","1","3"]

//类的数组
//用基本类型的数组创建NSArray类型的数组
var nsArr1: NSArray = arr1
var nsArr2 = NSArray(arrayLiteral: 10)
print("nsArr1 = \(nsArr1)")
print("nsArr2 = \(nsArr2)")
//as表示类型转换
var arr3 = nsArr1 as! [Int]
print(arr3)

//2、数组的方法和属性
//1)数组的元素个数
print(arr1.count)
print(nsArr1.count)

//2)数组的拼接
//基本类型
//
arr1.append(20)
print(arr1)
//NSArray类型
var nsMutableArr = NSMutableArray(array: arr1)
nsMutableArr.addObject(20)

//3)获取数组元素
let ele = arr1[0]
print(ele)

let ele2 = arr1[1...2]
print(ele2)

//NSArray
//获取第一个元素
let nsEle = nsArr1.objectAtIndex(0)

//4)插入元素
//在第一个位置插入一个值为50的元素
arr1.insert(50, atIndex: 0)
print(arr1)

//NSMutabelArray
nsMutableArr.insertObject(100, atIndex: 0)
print(nsMutableArr)

//5)删除元素
arr1.removeAtIndex(1)
print(arr1)
//NSMutableArray
nsMutableArr.removeObjectAtIndex(1)
print(nsMutableArr)

//6)遍历数组
for i in arr1 {
    print("i=\(i)")
}

for i in nsMutableArr {
    print("i = \(i)")
}










