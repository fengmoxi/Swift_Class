//
//  ResultViewController.swift
//  HomeWork_02-Company
//
//  Created by 风漠兮 on 16/1/10.
//  Copyright © 2016年 风漠兮. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let label = self.createLabel(CGRectMake(80, 100, 200, 300), title: "")
        label.tag = 300
        label.numberOfLines = 0
        self.view.addSubview(label)
        
        self.view.backgroundColor = UIColor.purpleColor()
    }
    func createLabel(frame:CGRect,title:String) -> UILabel{
        
        let label = UILabel(frame: frame)
        label.text = title
        
        return label
    }
    func show() {
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        var str: String = String()
        
        //拼接字符串
        for com in appDele.array {
            //%d %ld :整型
            //%f %lf :浮点
            //%@:字符串
            let comStr = String(format: "公司名称:%@,法人代表:%@,注册资金:%@", arguments: [com.companyName!,com.boss!,com.money!])
            
            str.appendContentsOf(comStr)
        }
        
        //显示
        let label = self.view.viewWithTag(300) as! UILabel
        label.text = str
        
        
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
