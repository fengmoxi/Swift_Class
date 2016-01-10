//
//  CompanyViewController.swift
//  Homework_02
//
//  Created by gaokunpeng on 15/12/18.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //创建label和textField
        let array = ["公司名称","法人代表","注册资金"]
        
        for var i=0;i<array.count;i++ {
            //文字
            let label = self.createLabel(CGRectMake(40, CGFloat(100+80*i), 100, 40), title: array[i])
            self.view.addSubview(label)
            
            //输入框
            let textField = self.createTextField(CGRectMake(180, CGFloat(100+80*i), 160, 40), placeHolder: "请输入文字")
            textField.tag = 200+i
            
            self.view.addSubview(textField)
            
            
        }
        
        //保存按钮
        let saveBtn = self.createBtn(CGRectMake(260, 500, 80, 40), title: "保存", target: self, action: "saveAction")
        self.view.addSubview(saveBtn)
        
        self.view.backgroundColor = UIColor.greenColor()
        
    }
    
    //保存
    func saveAction() {
    
        //获取数据
        let nameTextField = self.view.viewWithTag(200) as! UITextField
        let bossTextField = self.view.viewWithTag(201) as! UITextField
        let moneyTextField = self.view.viewWithTag(202) as! UITextField
        
        //创建对象
        let com = Company()
        com.companyName = nameTextField.text
        com.boss = bossTextField.text
        com.money = moneyTextField.text
        
        //存储
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        appDele.array.append(com)
        
        
        
        
        
    }
    
    //添加按钮的方法
    func createBtn(frame:CGRect,title:String,target:AnyObject?,action:Selector) -> UIButton{
        
        let btn = UIButton(type: UIButtonType.System)
        btn.frame = frame
        btn.setTitle(title, forState: UIControlState.Normal)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        return btn
    }
    
    
    //文字
    func createLabel(frame:CGRect,title:String) -> UILabel{
        
        let label = UILabel(frame: frame)
        label.text = title
        
        return label
    }
    
    //输入框
    func createTextField(frame:CGRect,placeHolder: String) -> UITextField{
        let textField = UITextField(frame: frame)
        textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.placeholder = placeHolder
        
        return textField
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
