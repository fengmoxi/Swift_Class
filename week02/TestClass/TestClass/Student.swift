//
//  Student.swift
//  TestClass
//
//  Created by gaokunpeng on 15/11/27.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation


class Student {
    //属性
    var name: String
    //构造方法
    /*
    系统默认的构造方法是
    init(){
    }
    
    如果我们重新实现了构造方法，会覆盖系统默认的构造方法
    */
    init(tmpName: String){
        name = tmpName
    }
    
    
}

