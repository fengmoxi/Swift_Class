//
//  ViewController.swift
//  TestTapGesture
//
//  Created by gaokunpeng on 15/12/18.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //手势并不是视图，不能够显示出来
        //手势只能跟某一个视图关联
        //给视图加上与用户交互的功能
        
        //视图
        let redView = UIView(frame: CGRectMake(100,200,140,80))
        redView.backgroundColor = UIColor.redColor()
        //设置tag值
        redView.tag = 300
        self.view.addSubview(redView)
        
        //添加点击的手势
        /*
        第一个参数:手势响应的对象
        第二个参数:手势响应的方法
        //加冒号表示传递参数,实参是手势对象
        */
        let g = UITapGestureRecognizer(target: self, action: "tapAction:")
        //将手势跟视图关联
        redView.addGestureRecognizer(g)
        
        
    }
    
    func tapAction(g: UITapGestureRecognizer) {
        print("tap")
        
        //获取手势关联的视图对象
        let view = g.view
        
        let redView = self.view.viewWithTag(300)
        
        if view == redView {
            print("true")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

