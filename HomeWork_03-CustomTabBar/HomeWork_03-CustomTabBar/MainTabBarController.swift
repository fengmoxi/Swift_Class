//
//  MainTabBarController.swift
//  HomeWork_03-CustomTabBar
//
//  Created by 风漠兮 on 16/1/10.
//  Copyright © 2016年 风漠兮. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    //属性
    var lineView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let firstCtrl = FirstViewController()
        let secondCtrl = SecondViewController()
        let thirdCtrl = ThirdViewController()
        let fourthCtrl = FourthViewController()
        self.viewControllers = [firstCtrl,secondCtrl,thirdCtrl,fourthCtrl]
        self.tabBar.hidden = true
        let imageNames = ["tab_0","tab_1","tab_2","tab_3"]
        let selectImageNames = ["tab_c0","tab_c1","tab_c2","tab_c3"]
        let bgImageView = MyUtil.createImageView(CGRectMake(0, 667-49, 375, 49), imageName: "tabbg")
        bgImageView.tag = 400
        bgImageView.userInteractionEnabled = true
        self.view.addSubview(bgImageView)
        let w = 376/4
        for var i=0;i<imageNames.count;i++ {
            let imageName = imageNames[i]
            let sImageName = selectImageNames[i]
            let btn = MyUtil.createBtn(CGRectMake(CGFloat(w * i), 0, CGFloat(w), 49), imageName: imageName, selectImageName: sImageName, target: self, action: "clickBtn:")
            btn.tag = 300+i
            bgImageView.addSubview(btn)
            if i == 0 {
                btn.selected = true
            }
        }
        self.lineView = UIView(frame: CGRectMake(30,42,30,2))
        self.lineView?.backgroundColor = UIColor.purpleColor()
        bgImageView.addSubview(self.lineView!)
    }
    
    func clickBtn(btn: UIButton) {
        let bgImageView = self.view.viewWithTag(400)
        let lastBtn = bgImageView?.viewWithTag(300+self.selectedIndex) as! UIButton
        lastBtn.selected = false
        let index = btn.tag-300
        self.selectedIndex = index
        UIView.animateWithDuration(0.05) { () -> Void in
            self.lineView?.frame = CGRectMake(CGFloat(30+94*index), 42, 30, 2)
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
