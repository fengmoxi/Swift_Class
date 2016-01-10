//
//  ViewController.swift
//  TestLongPressGesture
//
//  Created by gaokunpeng on 15/12/18.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //UILabel添加长按手势
        let label = UILabel(frame: CGRectMake(80,200,140,60))
        label.text = "长按手势"
        label.backgroundColor = UIColor.purpleColor()
        self.view.addSubview(label)
        
        //UIView默认开启了用户交互
        //UILabel默认关闭了用户交互
        label.userInteractionEnabled = true
        
        //长按手势
        let g = UILongPressGestureRecognizer(target: self, action: "longPressAction:")
        //关联到视图上面
        label.addGestureRecognizer(g)
    }
    
    func longPressAction(g: UILongPressGestureRecognizer) {
        
        print("long press")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

