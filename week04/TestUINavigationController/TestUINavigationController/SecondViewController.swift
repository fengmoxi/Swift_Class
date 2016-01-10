//
//  SecondViewController.swift
//  TestUINavigationController
//
//  Created by gaokunpeng on 15/12/11.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.redColor()
        
        //返回前面界面
        let btn = UIButton(type: UIButtonType.System)
        btn.frame = CGRectMake(150, 200, 100, 40)
        btn.setTitle("上一页", forState: UIControlState.Normal)
        btn.addTarget(self, action: "backAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        
        //下一页
        let nextBtn = UIButton(type: UIButtonType.System)
        nextBtn.frame = CGRectMake(150, 300, 100, 40)
        nextBtn.setTitle("下一页", forState: UIControlState.Normal)
        nextBtn.addTarget(self, action: "nextPage", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(nextBtn)
        
    }
    
    func nextPage(){
        //下一页
        let thirdCtrl = ThirdViewController()
        self.navigationController?.pushViewController(thirdCtrl, animated: true)
    }
    
    func backAction(){
        //返回上一页
        //参数:是否有动画
        self.navigationController?.popViewControllerAnimated(true)
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
