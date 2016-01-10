//
//  ViewController.swift
//  TestUIButton
//
//  Created by gaokunpeng on 15/11/27.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //UIButton的使用
        //UIButton: UIView
        //1.按钮显示文字
        //创建按钮对象
        let btn = UIButton(type: UIButtonType.System)
        //设置frame
        btn.frame = CGRectMake(80, 100, 100, 40)
        //显示文字
        //第一个参数:显示的文字
        //第二个参数:在哪种状态显示这个文字
        btn.setTitle("按钮一", forState: UIControlState.Normal)
        btn.setTitle("高亮", forState: UIControlState.Highlighted)
        //添加到父视图
        self.view.addSubview(btn)
        //修改字体大小
        btn.titleLabel?.font = UIFont.systemFontOfSize(30)
        
        //2.显示背景图片
        //显示图片需要使用Custom类型
        let btn2 = UIButton(type: UIButtonType.Custom)
        //设置位置和大小
        btn2.frame = CGRectMake(80, 160, 100, 40)
        //设置背景图片
        //iOS对png图片支持最好
        let image2 = UIImage(named: "button_down")
        btn2.setBackgroundImage(image2, forState: UIControlState.Normal)
        //添加到父视图
        self.view.addSubview(btn2)
        
        //3.设置图片
        //Custom
        //创建按钮
        let btn3 = UIButton(type: UIButtonType.Custom)
        //设置位置和大小
        btn3.frame = CGRectMake(80, 240, 120, 40)
        //设置图片
        let image3 = UIImage(named: "logo")
        btn3.setImage(image3, forState: UIControlState.Normal)
        //添加到父视图
        self.view.addSubview(btn3)
        //设置文字
        btn3.setTitle("按钮三", forState: UIControlState.Normal)
        //修改文字颜色
        btn3.setTitleColor(UIColor.purpleColor(), forState: UIControlState.Normal)
        
        //添加事件
        let btn4 = UIButton(type: UIButtonType.System)
        //设置位置和大小
        btn4.frame = CGRectMake(80, 320, 120, 40)
        //设置文字
        btn4.setTitle("点我啊", forState: UIControlState.Normal)
        //添加到父视图
        self.view.addSubview(btn4)
        //添加事件
        /*
        第一个参数:事件响应后调用按个对象的方法
        第二个参数:事件响应后调用哪个方法
        //clickAction:冒号表示传一个参数
        //传递的实际参数就是按钮对象本身
        第三个参数:事件的类型
        */
        //btn4.addTarget(self, action: Selector("clickAction:"), forControlEvents: UIControlEvents.TouchUpInside)
        //跟上面的写法是等价的
        //btn4.addTarget(self, action: "clickAction:", forControlEvents: UIControlEvents.TouchUpInside)
        //这种不要参数的写法
        btn4.addTarget(self, action: "click", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func click(){
        print("无参数的方法")
    }
    
    func clickAction(btn: UIButton){
        print("点击了按钮")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

