//
//  SecondViewController.swift
//  TestLifeCycle
//
//  Created by gaokunpeng on 15/12/4.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

/*
//生命周期方法的调用顺序
init
loadView
viewDidLoad
viewWillAppear
viewDidAppear
viewWillDisappear
viewDidDisappear
*/

class SecondViewController: UIViewController {
    
    //这是视图控制器创建时调用的方法
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("init")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //每一个视图控制器都有一个属性view
    //创建self.view的方法
    override func loadView() {
        super.loadView()
        print("loadView")
        //这里也可以自定义self.view
    }
    
    
    //这个方法在创建self.view之后
    //给self.view添加子视图时调用
    //这个方法只会调用一次
    override func viewDidLoad() {
        super.viewDidLoad()

        print("viewDidLoad")
        
        // Do any additional setup after loading the view.
        //背景颜色
        self.view.backgroundColor = UIColor.purpleColor()
        //按钮
        let btn = UIButton(type: UIButtonType.System)
        btn.frame = CGRectMake(80, 100, 100, 40)
        btn.setTitle("返回", forState: UIControlState.Normal)
        btn.addTarget(self, action: "backAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    //在视图将要显示的时候调用
    //这个方法会调用多次
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    //在视图显示之后调用
    //这个方法会调用多次
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    
    func backAction(){
        //返回前面的界面
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    //视图控制器的view将要从父视图移除
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
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
