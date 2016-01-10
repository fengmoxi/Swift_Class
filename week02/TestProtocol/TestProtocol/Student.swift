//
//  Student.swift
//  TestProtocol
//
//  Created by gaokunpeng on 15/11/27.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation

//遵守协议produceDelegate
class Student: produceDelegate {
    
    //制造手机
    func produceCellPhone(){
        print("I'm a student,I'm producing a cell phone.")
    }
    
}
