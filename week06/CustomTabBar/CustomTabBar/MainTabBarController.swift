//
//  MainTabBarController.swift
//  CustomTabBar
//
//  Created by gaokunpeng on 15/12/25.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    //属性
    var lineView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //视图控制器
        self.createViewControllers()
    
        //自定制tabBar
        self.tabBar.hidden = true
        
        self.createTabBar()
        
    }
    
    //自定制tabBar
    func createTabBar() {
        //图片数组
        let imageNames = ["tab_0","tab_1","tab_2","tab_3"]
        let selectImageNames = ["tab_c0","tab_c1","tab_c2","tab_c3"]
        
        
        //创建背景图片
        let bgImageView = MyUtil.createImageView(CGRectMake(0, 667-49, 375, 49), imageName: "tabbg")
        bgImageView.tag = 400
        //开启用户的交互
        bgImageView.userInteractionEnabled = true
        self.view.addSubview(bgImageView)
        
        let w = 376/4
        for var i=0;i<imageNames.count;i++ {
            //循环创建按钮
            let imageName = imageNames[i]
            let sImageName = selectImageNames[i]
            
            //按钮
            
            let btn = MyUtil.createBtn(CGRectMake(CGFloat(w * i), 0, CGFloat(w), 49), imageName: imageName, selectImageName: sImageName, target: self, action: "clickBtn:")
            btn.tag = 300+i
            
            bgImageView.addSubview(btn)
            
            //默认选中第一个
            if i == 0 {
                btn.selected = true
            }
            
        }
        
        //创建底部的横线
        self.lineView = UIView(frame: CGRectMake(30,42,30,2))
        self.lineView?.backgroundColor = UIColor.purpleColor()
        bgImageView.addSubview(self.lineView!)
        
    }
    
    //点击按钮
    func clickBtn(btn: UIButton) {
        // btn.tag-300
        
        //self.selectedIndex
        //self.selectedViewController
        //取消前面选中的按钮
        let bgImageView = self.view.viewWithTag(400)
        let lastBtn = bgImageView?.viewWithTag(300+self.selectedIndex) as! UIButton
        lastBtn.selected = false
        
        //选中当前的按钮
        //selected是系统定义的
        //selected = true，btn显示的图片就是selected状态的
        //selected = false,btn显示的图片就是normal状态的
        
        //修改当前显示的视图控制器
        let index = btn.tag-300
        self.selectedIndex = index
        
        //修改横线的位置
        /*
        第一个参数:动画的事件
        第二个参数:动画修改的内容
        */
        UIView.animateWithDuration(0.05) { () -> Void in
            self.lineView?.frame = CGRectMake(CGFloat(30+94*index), 42, 30, 2)
        }
        
        
        
    }
    

    
    //显示视图控制器
    func createViewControllers() {
        
        let firstCtrl = FirstViewController()
        let secondCtrl = SecondViewController()
        let thirdCtrl = ThirdViewController()
        let fourthCtrl = FourthViewController()
        
        self.viewControllers = [firstCtrl,secondCtrl,thirdCtrl,fourthCtrl]
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
