//
//  ViewController.swift
//  HomeWork_01-Calculator
//
//  Created by 风漠兮 on 16/1/10.
//  Copyright © 2016年 风漠兮. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var textLabel: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textLabel = UILabel(frame: CGRectMake(40,40,280,30))
        self.textLabel?.textAlignment = NSTextAlignment.Right
        self.textLabel?.text = "0"
        self.view.addSubview(self.textLabel!)
        
        let array = ["MC","M+","M-","MR","清除"]
        for var i=0;i<array.count;i++ {
            let str = array[i]
            let btn = UIButton(type: UIButtonType.System)
            btn.frame = CGRectMake(CGFloat(70*i), 100, 70, 30)
            btn.setTitle(str, forState: UIControlState.Normal)
            btn.addTarget(self, action: "clickBtn:", forControlEvents: UIControlEvents.TouchUpInside)
            btn.tag = 100+i
            self.view.addSubview(btn)
            
        }
        
        let numArray = ["7","8","9","+","4","5","6","-","1","2","3","×","0",".","=","÷"]
        for var j=0;j<numArray.count;j++ {
            let str = numArray[j]
            let row = j/4
            let col = j%4
            let btn = UIButton(type: UIButtonType.System)
            btn.frame = CGRectMake(CGFloat(80*col), CGFloat(180+80*row), 80, 30)
            btn.setTitle(str, forState: UIControlState.Normal)
            btn.tag = 200+j
            btn.addTarget(self, action: "clickAction:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(btn)
        }
    }
    
    func caculate() {
        let cs = NSCharacterSet(charactersInString: "+-×÷")
        let array = self.textLabel?.text?.componentsSeparatedByCharactersInSet(cs)
        let arr: NSArray = NSArray(array: array!)
        if arr.count == 2 {
            let num1 = arr[0]
            let num2 = arr[1]
            let str = (self.textLabel?.text)! as NSString
            let range = str.rangeOfString(num1 as! String)
            let op = str.substringWithRange(NSMakeRange(range.location+range.length, 1))
            let a = CGFloat((num1 as! NSString).floatValue)
            let b = CGFloat((num2 as! NSString).floatValue)
            if op == "+" {
                let ret = a + b
                if String(format: "%f", arguments: [ret]).componentsSeparatedByString(".")[1] != "000000"
                {
                    self.textLabel?.text = String(format: "%f", arguments: [ret])
                }
                else
                {
                    self.textLabel?.text = String(format: "%f", arguments: [ret]).componentsSeparatedByString(".")[0]
                }
            }else if op == "-" {
                let ret = a - b
                if String(format: "%f", arguments: [ret]).componentsSeparatedByString(".")[1] != "000000"
                {
                    self.textLabel?.text = String(format: "%f", arguments: [ret])
                }
                else
                {
                    self.textLabel?.text = String(format: "%f", arguments: [ret]).componentsSeparatedByString(".")[0]
                }
                
            }else if op == "×" {
                let ret = a * b
                if String(format: "%f", arguments: [ret]).componentsSeparatedByString(".")[1] != "000000"
                {
                    self.textLabel?.text = String(format: "%f", arguments: [ret])
                }
                else
                {
                    self.textLabel?.text = String(format: "%f", arguments: [ret]).componentsSeparatedByString(".")[0]
                }
                
            }else if op == "÷" {
                let ret = a / b
                if String(format: "%f", arguments: [ret]).componentsSeparatedByString(".")[1] != "000000"
                {
                    self.textLabel?.text = String(format: "%f", arguments: [ret])
                }
                else
                {
                    self.textLabel?.text = String(format: "%f", arguments: [ret]).componentsSeparatedByString(".")[0]
                }
            }
        }
    }
    func clickAction(btn: UIButton) {
        if btn.tag == 214 {
            self.caculate()
        }else{
            let str = btn.currentTitle
            if self.textLabel?.text == "0" {
                self.textLabel?.text = str
            }else{
                let text = String(format: "%@%@", arguments: [(self.textLabel?.text)!, str!])
                self.textLabel?.text = text
            }
        }
    }
    
    func clickBtn(btn: UIButton) {
        if btn.tag == 104 {
            self.textLabel?.text = "0"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

