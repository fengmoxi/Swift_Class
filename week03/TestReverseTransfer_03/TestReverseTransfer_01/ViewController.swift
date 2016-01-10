//
//  ViewController.swift
//  TestReverseTransfer_01
//
//  Created by gaokunpeng on 15/12/4.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        
        //添加通知
        /*
        第一个参数:通知发送时调用哪个对象的方法
        第二个参数:通知发送时调用哪个方法
        //:表示传递一个通知对象作为参数
        第三个参数:通知的名字
        第四个参数:通知由哪个对象发送,通常传nil,表示任何对象发送的通知都会接收
        */
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "notiAction:", name: "changeValue", object: nil)
    }
    
    func notiAction(noti: NSNotification){
        //处理通知
        let dict = noti.userInfo as! Dictionary<String,String>
        let text = dict["text"]
        
        //显示到label上面
        let label = self.view.viewWithTag(200) as! UILabel
        label.text = text
    }
    
    deinit {
        //移除当前对象注册的所有通知
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func nextAction(){
        //跳转到后面的视图控制器
        let nextCtrl = NextViewController()
        self.presentViewController(nextCtrl, animated: true) { () -> Void in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

