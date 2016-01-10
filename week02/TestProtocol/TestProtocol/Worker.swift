//
//  Worker.swift
//  TestProtocol
//
//  Created by gaokunpeng on 15/11/27.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation

//定义一个协议
//produceDelegate是协议的名字
//协议里面通常是规定一些共同的行为或属性
protocol produceDelegate{
    //制造手机
    //协议里面的方法不需要实现
    func produceCellPhone()
}

//: produceDelegate表示遵守协议
class Worker: produceDelegate {
    
    //没有协议的实现
    func produceCellPhone(){
        print("I'm a worker, I'm producing a cell phone")
    }
}


