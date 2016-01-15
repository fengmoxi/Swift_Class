//
//  MainTabBarController.swift
//  TestLimit_01
//
//  Created by gaokunpeng on 16/1/15.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //创建视图控制器
        self.createViewControllers()
        
    }
    
    //创建视图控制器
    func createViewControllers() {
        
        //图片
        let images = ["tabbar_limitfree","tabbar_reduceprice","tabbar_appfree","tabbar_subject","tabbar_rank"]
        //选中下的图片
        let selectImages = ["tabbar_limitfree_press","tabbar_reduceprice_press","tabbar_appfree_press","tabbar_subject_press","tabbar_rank_press"]
        //文字
        let titles = ["限免","降价","免费","专题","热榜"]
        //视图控制器
        let ctrlArray: Array<UIViewController> = [LimitFreeViewController(), ReduceViewController(), FreeViewController(), SubjectViewController(), RankViewController()]
        
        //存储导航视图控制器
        var array = Array<UINavigationController>()
        //循环创建视图控制器
        for var i=0;i<images.count;i++ {
            let imageName = images[i]
            let sImageName = selectImages[i]
            let title = titles[i]
            let ctrl = ctrlArray[i]
            
            ctrl.tabBarItem.title = title
            ctrl.tabBarItem.image = UIImage(named: imageName)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            ctrl.tabBarItem.selectedImage = UIImage(named: sImageName)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            //导航
            let navCtrl = UINavigationController(rootViewController: ctrl)
            array.append(navCtrl)
        }
        self.viewControllers = array
        
        
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
