//
//  ViewController.swift
//  TestPositiveTransfer
//
//  Created by gaokunpeng on 15/12/4.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //点击按钮，跳转到第二个界面
        let btn = UIButton(type: UIButtonType.System)
        btn.frame = CGRectMake(80, 200, 100, 40)
        btn.setTitle("跳转", forState: UIControlState.Normal)
        btn.addTarget(self, action: "nextAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        //文本输入框
        let textField = UITextField(frame: CGRectMake(80,100,200,40))
        textField.tag = 100
        textField.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(textField)
    }
    
    func nextAction(){
        let nextCtrl = NextViewController()
        //传值
        let textField = self.view.viewWithTag(100) as! UITextField
        nextCtrl.name = textField.text
        self.presentViewController(nextCtrl, animated: true) { () -> Void in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

