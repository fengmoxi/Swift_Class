//
//  ViewController.swift
//  TestRotateGesture
//
//  Created by gaokunpeng on 15/12/18.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //在视图上添加旋转的手势
        let redView = UIView(frame: CGRectMake(80,300,200,100))
        redView.backgroundColor = UIColor.redColor()
        self.view.addSubview(redView)
        redView.tag = 300
        
        //旋转手势
        let g = UIRotationGestureRecognizer(target: self, action: "rotateAction:")
        redView.addGestureRecognizer(g)
    }
    
    func rotateAction(g: UIRotationGestureRecognizer) {
        //获取旋转的角度
        //g.rotation
        
        //旋转
        let redView = self.view.viewWithTag(300)
        redView?.transform = CGAffineTransformMakeRotation(g.rotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

