//
//  ViewController.swift
//  HomeWork_02-Company
//
//  Created by 风漠兮 on 16/1/10.
//  Copyright © 2016年 风漠兮. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var companyCtrl: CompanyViewController = CompanyViewController()
    var resultCtrl: ResultViewController = ResultViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let companyBtn = self.createBtn(CGRectMake(0,667-40,190,40), title: "公司", target: self, action: "gotoCompany")
        self.view.addSubview(companyBtn)
        let resultBtn = self.createBtn(CGRectMake(190, 667-40, 185, 40), title: "结果", target: self, action: "gotoResult")
        self.view.addSubview(resultBtn)
        self.resultCtrl.view.frame = CGRectMake(0, 0, 375, 667-40)
        self.view.addSubview(self.resultCtrl.view)
        self.companyCtrl.view.frame = CGRectMake(0, 0, 375, 667-40)
        self.view.addSubview(self.companyCtrl.view)
    }
    
    func gotoCompany(){
        self.view.bringSubviewToFront(self.companyCtrl.view)
    }

    func gotoResult() {
        self.view.bringSubviewToFront(self.resultCtrl.view)
        self.resultCtrl.show()
        
    }
    
    func createBtn(frame:CGRect,title:String,target:AnyObject?,action:Selector) -> UIButton{
        let btn = UIButton(type: UIButtonType.System)
        btn.frame = frame
        btn.setTitle(title, forState: UIControlState.Normal)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

