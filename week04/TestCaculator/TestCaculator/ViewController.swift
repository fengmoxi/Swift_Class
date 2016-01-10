//
//  ViewController.swift
//  TestCaculator
//
//  Created by gaokunpeng on 15/12/11.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //显示文字
    var textLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //创建UILabel
        self.textLabel = UILabel(frame: CGRectMake(40,40,280,30))
        self.textLabel?.textAlignment = NSTextAlignment.Right
        self.textLabel?.text = "0"
        self.view.addSubview(self.textLabel!)
        
        //创建按钮
        self.createBtn()
        
    }
    
    //创建按钮
    func createBtn() {
        let array = ["MC","M+","M-","MR","清除"]
        //循环创建功能按钮
        for var i=0;i<array.count;i++ {
            //文字
            let str = array[i]
            //按钮
            let btn = UIButton(type: UIButtonType.System)
            btn.frame = CGRectMake(CGFloat(70*i), 100, 70, 30)
            btn.setTitle(str, forState: UIControlState.Normal)
            btn.addTarget(self, action: "clickBtn:", forControlEvents: UIControlEvents.TouchUpInside)
            //设置tag值
            btn.tag = 100+i
            self.view.addSubview(btn)
            
        }
        
        //按钮
        let numArray = ["7","8","9","+","4","5","6","-","1","2","3","×","0",".","=","÷"]
        for var j=0;j<numArray.count;j++ {
            //文字
            let str = numArray[j]
            
            //行
            let row = j/4
            //列
            let col = j%4
            
            //按钮
            let btn = UIButton(type: UIButtonType.System)
            btn.frame = CGRectMake(CGFloat(80*col), CGFloat(180+80*row), 80, 30)
            btn.setTitle(str, forState: UIControlState.Normal)
            btn.tag = 200+j
            btn.addTarget(self, action: "clickAction:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(btn)
        }
    }
    
    //计算
    func caculate() {
        //8+5
        let cs = NSCharacterSet(charactersInString: "+-×÷")
        
        let array = self.textLabel?.text?.componentsSeparatedByCharactersInSet(cs)
        let arr: NSArray = NSArray(array: array!)
        if arr.count == 2 {
            //获取操作数
            let num1 = arr[0]
            let num2 = arr[1]
            
            //获取运算符
            let str = (self.textLabel?.text)! as NSString
            let range = str.rangeOfString(num1 as! String)
            let op = str.substringWithRange(NSMakeRange(range.location+range.length, 1))
            
            //转换成浮点数
            let a = CGFloat((num1 as! NSString).floatValue)
            let b = CGFloat((num2 as! NSString).floatValue)
            
            //判断计算类型
            if op == "+" {
                let ret = a + b
                self.textLabel?.text = String(format: "%f", arguments: [ret])
            }else if op == "-" {
                let ret = a - b
                self.textLabel?.text = String(format: "%f", arguments: [ret])
            
            }else if op == "×" {
                let ret = a * b
                self.textLabel?.text = String(format: "%f", arguments: [ret])
            
            }else if op == "÷" {
                let ret = a / b
                self.textLabel?.text = String(format: "%f", arguments: [ret])
            }
            
        }
        
        
        
        
    }
    
    //数字按钮
    func clickAction(btn: UIButton) {
        
        if btn.tag == 214 {
            //点击等号
            //计算
            self.caculate()
        }else{
            //将文字显示到label上面
            //获取按钮上面的文字
            let str = btn.currentTitle
            //btn.titleForState(UIControlState.Normal)
            if self.textLabel?.text == "0" {
                self.textLabel?.text = str
            }else{
                //在后面追加文字
                let text = String(format: "%@%@", arguments: [(self.textLabel?.text)!, str!])
                self.textLabel?.text = text
            }
            
        }
    }
    
    //功能按钮
    func clickBtn(btn: UIButton) {
        //清除
        if btn.tag == 104 {
            self.textLabel?.text = "0"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

