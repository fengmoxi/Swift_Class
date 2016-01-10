//
//  RootViewController.swift
//  Homework_02
//
//  Created by gaokunpeng on 15/12/18.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    
    var companyCtrl: CompanyViewController = CompanyViewController()
    var resultCtrl: ResultViewController = ResultViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        //创建按钮
        //公司
        let companyBtn = self.createBtn(CGRectMake(0,667-40,190,40), title: "公司", target: self, action: "gotoCompany")
        self.view.addSubview(companyBtn)
        
        //结果
        let resultBtn = self.createBtn(CGRectMake(190, 667-40, 185, 40), title: "结果", target: self, action: "gotoResult")
        self.view.addSubview(resultBtn)
        
        //添加子视图
        self.resultCtrl.view.frame = CGRectMake(0, 0, 375, 667-40)
        self.view.addSubview(self.resultCtrl.view)
        
        self.companyCtrl.view.frame = CGRectMake(0, 0, 375, 667-40)
        self.view.addSubview(self.companyCtrl.view)
        
        
    }
    
    //公司
    func gotoCompany(){
        
        //将公司的视图显示到前面
        self.view.bringSubviewToFront(self.companyCtrl.view)
        
    }
    
    //结果
    func gotoResult() {
        
        //将结果的视图显示到前面
        self.view.bringSubviewToFront(self.resultCtrl.view)
        
        //重新显示
        self.resultCtrl.show()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //添加按钮的方法
    func createBtn(frame:CGRect,title:String,target:AnyObject?,action:Selector) -> UIButton{
        
        let btn = UIButton(type: UIButtonType.System)
        btn.frame = frame
        btn.setTitle(title, forState: UIControlState.Normal)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        return btn
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
