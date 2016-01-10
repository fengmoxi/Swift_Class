//
//  ViewController.swift
//  TestSwipeGesture
//
//  Created by gaokunpeng on 15/12/18.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //图片视图添加手势
        let imageView = UIImageView(frame: CGRectMake(80, 200, 160, 80))
        imageView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(imageView)
        
        //UIImageView默认关闭了用户交互
        imageView.userInteractionEnabled = true
        
        //滑动手势
        let g = UISwipeGestureRecognizer(target: self, action: "swipeAction:")
        //设置滑动的方向
        g.direction = UISwipeGestureRecognizerDirection.Left
        //滑动方向为左边和右边
        //g.direction = UISwipeGestureRecognizerDirection(rawValue: UISwipeGestureRecognizerDirection.Left.rawValue | UISwipeGestureRecognizerDirection.Right.rawValue)
        //关联视图
        imageView.addGestureRecognizer(g)
    }
    
    func swipeAction(g: UISwipeGestureRecognizer) {
        print("swipe")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

