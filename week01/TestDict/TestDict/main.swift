//
//  main.swift
//  TestDict
//
//  Created by gaokunpeng on 15/11/20.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation

print("Hello, World!")

//字典的使用
//字典存储数据的方式使用键值对
//key-value
//1、字典的创建
//key:value
var dict = ["name":"张三","age":10]
//可以用基本类型字典初始化NSDictionary类型对象
var nsDict = NSDictionary(dictionary: dict)
var nsDict2 = dict
print(nsDict)
print(nsDict2)

//2、字典的属性和方法
//元组  (key,value)
let a = (10,20)
//1)遍历
for (key,value) in dict {
    print(key)
    print(value)
}

//2)字典添加数据
var nsMutableDict = NSMutableDictionary(dictionary: dict)
nsMutableDict.setObject("上海", forKey: "city")
print(nsMutableDict)

//3)删除数据
nsMutableDict.removeObjectForKey("name")
print(nsMutableDict)

//4)获取key值
//dict.keys
//dict.values

//nsMutableDict.allKeys
//nsMutableDict.allValues





