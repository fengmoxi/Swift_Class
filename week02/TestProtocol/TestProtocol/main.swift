//
//  main.swift
//  TestProtocol
//
//  Created by gaokunpeng on 15/11/27.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation

print("Hello, World!")

/*
let b = Boss()
//let w = Worker()
let s = Student()
//b.delegate = w
b.delegate = s
//完成订单
b.completeOrder()
*/

//使用代理和协议的方式来实现
let b = Boss()
//let w = Worker()
//b.delegate = w
let s = Student()
b.delegate = s
b.completeOrder()



