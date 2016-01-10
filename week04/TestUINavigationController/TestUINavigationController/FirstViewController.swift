//
//  FirstViewController.swift
//  TestUINavigationController
//
//  Created by gaokunpeng on 15/12/11.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.grayColor()
        
        //添加按钮，点击跳转到第二个视图控制器界面
        let btn = UIButton(type: UIButtonType.System)
        btn.frame = CGRectMake(200, 100, 80, 40)
        btn.setTitle("下一页", forState: UIControlState.Normal)
        btn.addTarget(self, action: "nextPage", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    func nextPage(){
        let secondCtrl = SecondViewController()
        
        //导航视图控制器控制的每一个视图控制器都有一个属性
        //navigationController指向管理它的导航视图控制器对象
        /*
        第一个参数:导航显示的下一个界面
        第二个参数:是否有动画
        */
        self.navigationController?.pushViewController(secondCtrl, animated: true)
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
