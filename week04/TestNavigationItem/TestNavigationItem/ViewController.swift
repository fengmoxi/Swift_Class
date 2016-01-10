//
//  ViewController.swift
//  TestNavigationItem
//
//  Created by gaokunpeng on 15/12/11.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置标题
        //导航视图控制器控制的每一个视图控制器都有一个navigationItem属性，显示自己的导航内容
        
        //1、设置标题
        //self.navigationItem.title = "首页"
        
        //2.导航中间显示任意视图对象
        let imageView = UIImageView(frame: CGRectMake(0, 0, 40, 30))
        imageView.image = UIImage(named: "itemImage")
        self.navigationItem.titleView = imageView
        
        //3.左边按钮
        //必须是UIBarButtonItem类型的对象
        /*
        第一个参数:按钮的样式
        第二个参数:点击按钮响应哪个对象的方法
        第三个参数:点击按钮响应哪个方法(:表示传递参数,实参是UIBarButtonItem类型的对象)
        */
        let leftItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: self, action: "clickLeft:")
        self.navigationItem.leftBarButtonItem = leftItem
        
        //self.navigationItem.leftBarButtonItems
        
        //4.右边按钮
        //自己写的按钮可以设置背景图片
        let myBtn = UIButton(type: UIButtonType.System)
        myBtn.frame = CGRectMake(0, 0, 60, 40)
        myBtn.setTitle("设置", forState: UIControlState.Normal)
        myBtn.addTarget(self, action: "clickBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let rightItem = UIBarButtonItem(customView: myBtn)
        self.navigationItem.rightBarButtonItem = rightItem
        
        //self.navigationItem.rightBarButtonItems
    }
    
    func clickBtn(btn: UIButton) {
        print("right")
    }
    
    func clickLeft(bItem: UIBarButtonItem) {
        print("left")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

