//
//  NextViewController.swift
//  TestReverseTransfer_01
//
//  Created by gaokunpeng on 15/12/4.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

//将第一个视图控制器对象作为第二个视图控制器对象的代理
protocol NextViewControllerDelegate {
    
    //定义方法
    func transferValue(text: String)
}

class NextViewController: UIViewController {
    
    //代理属性
    var delegate: NextViewControllerDelegate?

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
        //传值
        let textField = self.view.viewWithTag(200) as! UITextField
        
        self.delegate?.transferValue(textField.text!)
        
        
        
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
