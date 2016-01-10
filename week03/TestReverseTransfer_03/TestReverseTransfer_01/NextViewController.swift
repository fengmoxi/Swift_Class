//
//  NextViewController.swift
//  TestReverseTransfer_01
//
//  Created by gaokunpeng on 15/12/4.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //文本输入框
        let textField = UITextField(frame: CGRectMake(100,100,200,40))
        textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.tag = 200
        self.view.addSubview(textField)
        
        //设置背景颜色
        self.view.backgroundColor = UIColor.redColor()
        
        //按钮，点击返回前面的界面
        let btn = UIButton(type: UIButtonType.System)
        btn.frame = CGRectMake(140, 200, 100, 40)
        btn.setTitle("返回", forState: UIControlState.Normal)
        btn.addTarget(self, action: "backAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    func backAction(){
        
        //发送通知
        /*
        第一个参数:通知的名字(跟注册的时候一致)
        第二个参数:哪个对象发送这个通知(nil)
        第三个参数:传参
        */
        //文本输入框
        let textField = self.view.viewWithTag(200) as! UITextField
        let dict: Dictionary<String,String> = ["text":textField.text!]
        NSNotificationCenter.defaultCenter().postNotificationName("changeValue", object: nil, userInfo: dict)
        
        //返回前面的界面
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
