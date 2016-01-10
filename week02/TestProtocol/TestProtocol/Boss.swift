//
//  Boss.swift
//  TestProtocol
//
//  Created by gaokunpeng on 15/11/27.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation

class Boss {
    
    //属性
    //var delegate: Worker?
    //没有协议时，每次都要修改属性的类型
    //var delegate: Student?
    
    //修改成协议和代理的方式
    var delegate: produceDelegate?
    
    //功能
    //完成订单
    //self是当前对象
    func completeOrder(){
        self.delegate?.produceCellPhone()
    }
}


