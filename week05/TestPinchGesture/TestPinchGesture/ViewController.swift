//
//  ViewController.swift
//  TestPinchGesture
//
//  Created by gaokunpeng on 15/12/18.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //在视图上面添加放大的手势
        let redView = UIView(frame: CGRectMake(80,200,200,300))
        redView.backgroundColor = UIColor.redColor()
        redView.tag = 300
        self.view.addSubview(redView)
        
        //添加放大/缩小手势
        let g = UIPinchGestureRecognizer(target: self, action: "pinchAction:")
        redView.addGestureRecognizer(g)
    }
    
    func pinchAction(g: UIPinchGestureRecognizer) {
        //获取放大/缩小的倍数
        //g.scale
        //获取视图对象
        let redView = self.view.viewWithTag(300)
        redView?.transform = CGAffineTransformMakeScale(g.scale, g.scale)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

