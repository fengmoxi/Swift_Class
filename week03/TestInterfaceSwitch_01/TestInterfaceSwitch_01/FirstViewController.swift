//
//  FirstViewController.swift
//  TestInterfaceSwitch_01
//
//  Created by gaokunpeng on 15/12/4.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.blueColor()
        
        //添加一个按钮，点击跳转到第二个视图控制器
        let btn = UIButton(type: UIButtonType.System)
        btn.frame = CGRectMake(80, 200, 100, 40)
        btn.setTitle("跳转", forState: UIControlState.Normal)
        //添加点击事件
        btn.addTarget(self, action: "clickBtn", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        //添加子视图控制器
        let secondCtrl = SecondViewController()
        self.addChildViewController(secondCtrl)        
    }
    
    func clickBtn(){
        //获取第二个视图控制器
        let secondCtrl = self.childViewControllers.last
        //每一个视图控制器有一个属性view
        self.view.addSubview((secondCtrl?.view)!)
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
