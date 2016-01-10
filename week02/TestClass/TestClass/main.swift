//
//  main.swift
//  TestClass
//
//  Created by gaokunpeng on 15/11/27.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation

print("Hello, World!")


//类
//类是对现实生活中具有相同的特征和行为的食物的描述
//相同的特征用属性来表示
//相同的行为用方法来表示

//一、类的使用
//Person是类名
//类名首字母大写
//MyPerson
class Person {
    //类的属性和方法都要放到大括号里面
    
    //属性
    //?表示可以有值，也可以没有值
    var name: String?
    
    //方法
    func desc(){
        print("我是\(name)")
    }
}

//类的继承
//Teacher是新的类名
//: Person表示Teacher类继承于Person类
//会把对应的属性和方法继承过来
class Teacher: Person {
    
    //新的属性
    var course: String?
    
    //新的方法
    func anotherDesc(){
        print("\(name)教\(course)")
    }
    
    //重写父类的方法
    //覆盖了父类的行为
    override func desc() {
        print("desc")
    }
    
}

//二、类的使用
//创建类的实例
let p1 = Person()
//执行某种行为
p1.desc()

//给属性赋值
p1.name = "张三"
p1.desc()

//Teacher: Person
//Teacher类是Person类的子类
//Person类是Teacher类的父类
let t1 = Teacher()
//父类的属性
t1.name = "王老师"
t1.course = "数学"
t1.anotherDesc()
//父类的方法
t1.desc()


//创建学生实例
//Instance
let s = Student(tmpName: "小明")
print(s.name)





