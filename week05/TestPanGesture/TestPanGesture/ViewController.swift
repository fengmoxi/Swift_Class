//
//  ViewController.swift
//  TestPanGesture
//
//  Created by gaokunpeng on 15/12/18.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //视图上面添加移动手势
        let redView = UIView(frame: CGRectMake(80,200,160,80))
        redView.backgroundColor = UIColor.redColor()
        self.view.addSubview(redView)
        
        //移动手势
        let g = UIPanGestureRecognizer(target: self, action: "panAction:")
        //关联视图
        redView.addGestureRecognizer(g)
    }
    
    func panAction(g: UIPanGestureRecognizer) {
        //获取移动的偏移量
        let point = g.translationInView(self.view)
        //修改红色视图的位置
        let redView = g.view
        redView?.center = CGPointMake(CGFloat((redView?.center.x)!+point.x), CGFloat((redView?.center.y)!+point.y))
        //将偏移量置零
        g.setTranslation(CGPointZero, inView: self.view)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

