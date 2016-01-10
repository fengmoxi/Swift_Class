//
//  FourthViewController.swift
//  TestUINavigationController
//
//  Created by gaokunpeng on 15/12/11.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.blueColor()
        
        //回退两个界面
        let btn = UIButton(type: UIButtonType.System)
        btn.frame = CGRectMake(150, 200, 160, 40)
        btn.setTitle("回到第二个", forState: UIControlState.Normal)
        btn.addTarget(self, action: "backToSecond", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    func backToSecond() {
        //回退两个界面
        //获取第二个界面的对象
        let secondCtrl = self.navigationController?.viewControllers[1]
        /*
        第一个参数:退回到的视图控制器
        第二个参数:是否有动画
        */
        self.navigationController?.popToViewController(secondCtrl!, animated: true)
        
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
