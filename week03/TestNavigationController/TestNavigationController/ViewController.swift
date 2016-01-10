//
//  ViewController.swift
//  TestNavigationController
//
//  Created by gaokunpeng on 15/12/4.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.redColor()
        
        //状态栏20
        //导航条高度是44
        //1、隐藏导航条
        //self.navigationController?.navigationBar.hidden = true
        
        //self.navigationController?.navigationBarHidden = true
        
        //2.设置导航条的背景颜色
        //self.navigationController?.navigationBar.backgroundColor = UIColor.greenColor()
        
        //self.navigationController?.navigationBar.barTintColor = UIColor.greenColor()
        
        //3.自定制背景图片
        //图片对象
        //竖屏
        let image = UIImage(named: "navigationbar")?.stretchableImageWithLeftCapWidth(0, topCapHeight: 0)
        
        self.navigationController?.navigationBar.setBackgroundImage(image, forBarMetrics: UIBarMetrics.Default)
        
        //横屏
        //高度是32
        let image2 = UIImage(named: "nav-32")?.stretchableImageWithLeftCapWidth(0, topCapHeight: 0)
        self.navigationController?.navigationBar.setBackgroundImage(image2, forBarMetrics: UIBarMetrics.Compact)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

