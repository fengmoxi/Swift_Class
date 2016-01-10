//
//  ViewController.swift
//  TestUIView
//
//  Created by gaokunpeng on 15/11/27.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //代码在这里写
        //视图的使用
        //什么是视图
        //手机屏幕上面能够看得见摸得着的都是一个视图对象
        //视图是UIView类型的对象
        
        //1、创建视图对象
        /*
        CGRect：表示视图的位置和大小
        包含两个属性
        1)origion:表示一个点
        CGPoint:x,y
        2)size:width,height
        */
        let frame = CGRectMake(80,100,100,40)
        let myView = UIView(frame:frame)
        //2.设置背景颜色
        //UIColor是用来表示颜色的类型
        myView.backgroundColor = UIColor.brownColor()
        //下面的方法可以获取任意的颜色值
        //UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        
        //3.添加到父视图
        //self.view是myView的父视图
        //myView是self.view的子视图
        self.view.addSubview(myView)
        
        //所有的能够显示的对象都是UIView类型的对象或者UIView子类型的对象
        
        //获取父视图
        let superView = myView.superview
        if superView == self.view {
            print("true")
        }
        
        //获取子视图
        //给子视图设置tag值
        myView.tag = 200
        let sub = self.view.viewWithTag(200)
        if sub == myView {
            print("true")
        }
        
        //总结
        //一个视图最多只有一个父视图
        //一个视图可以有任意个子视图
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

