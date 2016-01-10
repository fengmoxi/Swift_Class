//
//  ViewController.swift
//  TestUserDefaults
//
//  Created by gaokunpeng on 15/12/11.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //NSUserDefaults通常用来存储轻量级的数据
        //就是相对小一些的数据
        //比如我们通常需要判断程序是不是第一次启动
        
        
        //判断是否第一次
        //获取数据
        let ud = NSUserDefaults.standardUserDefaults()
        let str = ud.objectForKey("message")
        if nil != str {
            let isLaunched = str as! String
            if isLaunched == "isLaunched" {
                print("不是第一次启动")
            }else{
                print("第一次")
            }
        }else{
            print("第一次")
        }
        
        
        //获取单例对象
        //单例对象:在整个程序的运行过程中只会创建一个对象
        //let ud = NSUserDefaults.standardUserDefaults()
        //存储数据
        //用键值对的方式存储数据
        ud.setObject("isLaunched", forKey: "message")
        //同步到文件中
        ud.synchronize()
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

