//
//  MainTabBarController.swift
//  TestLimit
//
//  Created by gaokunpeng on 15/12/7.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        
        //创建视图控制器
        self.createViewControllers()
        
        
        
        
    }
    
    
    func createViewControllers() {
        
        let imageArray = ["tabbar_limitfree","tabbar_reduceprice","tabbar_appfree","tabbar_subject","tabbar_rank"]
        let selectImageArray = ["tabbar_limitfree_press","tabbar_reduceprice_press","tabbar_appfree_press","tabbar_subject_press","tabbar_rank_press"]
        let titleArray = ["限免","降价","免费","专题","热榜"]
        let ctrlArray = [LimitFreeViewController(),ReduceViewController(),FreeViewController(),SubjectViewController(),RankViewController()]
        
        
        var navArray = Array<UINavigationController>()
        
        for var i=0;i<imageArray.count;i++ {
            //创建视图控制器
            let ctrl = ctrlArray[i]
            
            //设置文字和图片
            ctrl.tabBarItem.title = titleArray[i]
            ctrl.tabBarItem.image = UIImage(named: imageArray[i])?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            ctrl.tabBarItem.selectedImage = UIImage(named: selectImageArray[i])?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            
            
            let navCtrl = UINavigationController(rootViewController: ctrl)
            
            navArray.append(navCtrl)
            
        }
        
        
        self.viewControllers = navArray
        
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
