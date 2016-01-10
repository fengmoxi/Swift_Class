//
//  ViewController.swift
//  TestUILabel
//
//  Created by gaokunpeng on 15/11/27.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //UILabel的使用
        //UILabel : UIView
        //1.显示文字
        //创建UILabel对象
        let label = UILabel(frame: CGRectMake(40,100,100,40))
        //显示文字
        label.text = "你好"
        //添加到父视图
        self.view.addSubview(label)
        
        //2.设置字体大小
        //创建视图
        let label2 = UILabel(frame: CGRectMake(40,200,200,40))
        //设置文字
        label2.text = "你好，上海"
        //添加到父视图
        self.view.addSubview(label2)
        //默认字体大小是系统的17号字体
        //设置字体大小
        label2.font = UIFont.systemFontOfSize(30)
        
        //3、设置文字颜色
        let label3 = UILabel(frame: CGRectMake(40,260,200,40))
        label3.text = "hello,swift"
        //设置文字颜色
        label3.textColor = UIColor.redColor()
        self.view.addSubview(label3)
        
        //4.文字的阴影
        let label4 = UILabel(frame: CGRectMake(40,320,200,40))
        label4.text = "我爱我的祖国"
        self.view.addSubview(label4)
        //设置阴影
        //阴影颜色
        label4.shadowColor = UIColor.greenColor()
        //阴影的偏移位置
        //第一个参数大于0表示在右边，小于0表示在左边
        //第二个参数大于0表示在下边，小于0表示在上边
        label4.shadowOffset = CGSizeMake(4, 4)
        
        //5.文字的对其方式
        let label5 = UILabel(frame: CGRectMake(40,400,200,40))
        //设置背景颜色
        //FFFFFF
        label5.backgroundColor = UIColor(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        label5.text = "hello"
        self.view.addSubview(label5)
        //默认是左对齐
        //修改为右对齐
        label5.textAlignment = NSTextAlignment.Right
        //修改为居中对其
        label5.textAlignment = NSTextAlignment.Center
        
        //6.多行文字
        let label6 = UILabel(frame: CGRectMake(40,480,260,200))
        label6.text = "前程往事成云烟，消散在彼此眼前，就连说过了再见，也看不见你有些哀怨"
        self.view.addSubview(label6)
        //默认只能显示一行文字
        //设置为0，有多少行，显示多少行
        //label6.numberOfLines = 0
        label6.numberOfLines = 2
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

