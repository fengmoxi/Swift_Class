//
//  ThirdViewController.swift
//  TestUINavigationController
//
//  Created by gaokunpeng on 15/12/11.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.purpleColor()
        
        //回到第一个视图控制器
        let btn = UIButton(type: UIButtonType.System)
        btn.frame = CGRectMake(140, 200, 100, 40)
        btn.setTitle("回到第一页", forState: UIControlState.Normal)
        btn.addTarget(self, action: "backToFirst", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        //下一页
        let nextBtn = UIButton(type: UIButtonType.System)
        nextBtn.frame = CGRectMake(140, 300, 100, 40)
        nextBtn.setTitle("下一页", forState: UIControlState.Normal)
        nextBtn.addTarget(self, action: "nextPage", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(nextBtn)
        
    }
    
    func nextPage(){
        //跳转下一页
        let fourthCtrl = FourthViewController()
        self.navigationController?.pushViewController(fourthCtrl, animated: true)
    }
    
    func backToFirst() {
        //回到根视图控制器
        self.navigationController?.popToRootViewControllerAnimated(true)
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
