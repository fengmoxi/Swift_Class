//
//  ViewController.swift
//  TestReverseTransfer_01
//
//  Created by gaokunpeng on 15/12/4.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

//遵守协议NextViewControllerDelegate
class ViewController: UIViewController ,NextViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //添加按钮
        let btn = UIButton(type: UIButtonType.System)
        btn.frame = CGRectMake(80, 200, 100, 40)
        btn.setTitle("跳转", forState: UIControlState.Normal)
        btn.addTarget(self, action: "nextAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        //显示文字
        let label = UILabel(frame: CGRectMake(80,100,100,30))
        label.backgroundColor = UIColor.blueColor()
        label.tag = 200
        self.view.addSubview(label)
    }
    
    func nextAction(){
        //跳转到后面的视图控制器
        let nextCtrl = NextViewController()
        //设置代理属性
        nextCtrl.delegate = self
        self.presentViewController(nextCtrl, animated: true) { () -> Void in
            
        }
    }
    
    //NextViewControllerDelegate代理方法
    func transferValue(text: String) {
        //将传递过来的值显示到label上面
        let label = self.view.viewWithTag(200) as! UILabel
        label.text = text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

