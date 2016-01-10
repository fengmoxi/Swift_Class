//
//  FirstViewController.swift
//  TestLifeCycle
//
//  Created by gaokunpeng on 15/12/4.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //设置背景颜色
        self.view.backgroundColor = UIColor.blueColor()
        //按钮
        let btn = UIButton(type: UIButtonType.System)
        btn.frame = CGRectMake(80, 200, 100, 40)
        btn.setTitle("跳转", forState: UIControlState.Normal)
        btn.addTarget(self, action: "clickBtn", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    func clickBtn(){
        //跳转到后面的界面
        let secondCtrl = SecondViewController()
        self.presentViewController(secondCtrl, animated: true) { () -> Void in
            
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
