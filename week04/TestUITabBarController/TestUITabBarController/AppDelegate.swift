//
//  AppDelegate.swift
//  TestUITabBarController
//
//  Created by gaokunpeng on 15/12/11.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //UITabBarController也是一个架构级的控件
        //用来管理其他的视图控制器对象
        //可以管理普通视图控制器，也可以管理导航视图控制器
        
        //第一个界面
        let firstCtrl = FirstViewController()
        //视图控制器的tabBarItem用来显示下面的文字和图片
        firstCtrl.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Bookmarks, tag: 100)
        //导航
        let firstNavCtrl = UINavigationController(rootViewController: firstCtrl)
        
        //第二个界面
        let secondCtrl = SecondViewController()
        //设置文字和图片
        secondCtrl.tabBarItem.title = "second"
        secondCtrl.tabBarItem.image = UIImage(named: "tab_0")
        //导航
        let secondNavCtrl = UINavigationController(rootViewController: secondCtrl)
        
        
        //第三个界面
        let thirdCtrl = ThirdViewController()
        //设置文字、图片、选中图片
        thirdCtrl.tabBarItem.title = "third"
        thirdCtrl.tabBarItem.image = UIImage(named: "tab_1")
        thirdCtrl.tabBarItem.selectedImage = UIImage(named: "tab_s")
        //导航
        let thirdNavCtrl = UINavigationController(rootViewController: thirdCtrl)
        
        //第四个界面
        let fourthCtrl = FourthViewController()
        //设置文字和图片
        fourthCtrl.tabBarItem.title = "fourth"
        //显示原始的图片
        fourthCtrl.tabBarItem.image = UIImage(named: "tab_2")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        //导航
        let fourthNavCtrl = UINavigationController(rootViewController: fourthCtrl)
        
        
        //第五个
        let fifthCtrl = FifthViewController()
        fifthCtrl.tabBarItem.title = "fifth"
        fifthCtrl.tabBarItem.image = UIImage(named: "tab_3")
        //导航
        let fifthNavCtrl = UINavigationController(rootViewController: fifthCtrl)
        
        //第六个界面
        let sixthCtrl = SixthViewController()
        sixthCtrl.tabBarItem.title = "sixth"
        sixthCtrl.tabBarItem.image = UIImage(named: "tab_0")
        //导航
        let sixthNavCtrl = UINavigationController(rootViewController: sixthCtrl)

        //总结:
        /*
        标签栏视图控制器最多只能显示五个视图控制器
        如果控制的视图控制器超过五个，剩余的所有视图控制器会显示在一个导航视图控制器里面
        */
        
        let tabCtrl = UITabBarController()
        //设置标签栏视图控制器管理的视图控制器数组
        tabCtrl.viewControllers = [firstNavCtrl,secondNavCtrl,thirdNavCtrl,fourthNavCtrl,fifthNavCtrl,sixthNavCtrl]
        
        //设置代理
        tabCtrl.delegate = self
        
        self.window?.rootViewController = tabCtrl
        
        
        return true
    }
    
    //UITabBarController代理
    //点击了某个视图控制器
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
    }
    //交换顺序的时候调用
    func tabBarController(tabBarController: UITabBarController, didEndCustomizingViewControllers viewControllers: [UIViewController], changed: Bool) {
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

