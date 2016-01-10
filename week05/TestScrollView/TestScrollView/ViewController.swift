//
//  ViewController.swift
//  TestScrollView
//
//  Created by gaokunpeng on 15/12/18.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //读取图片
        let path = NSBundle.mainBundle().pathForResource("3", ofType: "png")
        let image = UIImage(contentsOfFile: path!)
        
        //创建图片视图
        let imageView = UIImageView(frame: CGRectMake(0, 0, (image?.size.width)!, (image?.size.height)!))
        imageView.image = image
        
        //创建一个滚动视图对象
        //UIScrollView
        //用来显示超过自己大小的子视图
        let scrollView = UIScrollView(frame: CGRectMake(80,100,200,300))
        scrollView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(scrollView)
        
        //将图片视图显示到滚动视图上面
        scrollView.addSubview(imageView)
        
        //设置滚动范围
        scrollView.contentSize = CGSizeMake((image?.size.width)!, (image?.size.height)!)
        
        //设置最初显示的位置
        scrollView.contentOffset = CGPointMake(100, 100)
        
        //隐藏滚动条
        //水平方向
        scrollView.showsHorizontalScrollIndicator = false
        //垂直方向
        scrollView.showsVerticalScrollIndicator = false
        //取消回弹效果
        //scrollView.bounces = false
        
        //设置代理
        scrollView.delegate = self
        
        
    }
    
    //滚动视图减速结束
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
    
    //滚动视图滚动时调用
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("scrollViewDidScroll")
    }
    //停止滑动的时候调用
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

