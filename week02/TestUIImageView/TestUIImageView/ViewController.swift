//
//  ViewController.swift
//  TestUIImageView
//
//  Created by gaokunpeng on 15/11/27.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //使用UIImageView
        
        //第一种方式
        //UIImage:图片对象，用来存储图片的数据
        //沙盒
        //主沙盒目录NSBundle.mainBundle()
        //第一个参数:文件的名字
        //第二个参数:文件的扩展名
        let path = NSBundle.mainBundle().pathForResource("map", ofType: "png")
        
        //创建图片对象
        //参数是图片文件的路径
        //!表示强制获取它的值
        let image1 = UIImage(contentsOfFile: path!)
        
        //图片视图对象
        let imageView1 = UIImageView(image: image1)
        //设置位置和大小
        imageView1.frame = CGRectMake(30, 80, (image1?.size.width)!, (image1?.size.height)!)
        //添加到父视图
        self.view.addSubview(imageView1)
        
        //第二种方式
        //创建图片对象
        //获取路径
        let path2 = NSBundle.mainBundle().pathForResource("q", ofType: "jpg")
        //获取二进制数据
        let data = NSData(contentsOfFile: path2!)
        
        let image2 = UIImage(data: data!)
        //创建图片视图
        let imageView2 = UIImageView(frame: CGRectMake(0, 0, (image2?.size.width)!, (image2?.size.height)!))
        //设置图片
        imageView2.image = image2
        //添加到父视图
        imageView1.addSubview(imageView2)
        
        //第三种方式
        //图片对象
        //这种方式创建图片时会加缓存
        //通常小图片可以用这种方式
        //大图片用其他两种方式
        let image3 = UIImage(named: "player1.png")
        //图片视图对象
        let imageView3 = UIImageView(frame: CGRectMake(260, 40, 40, 40))
        //设置图片
        imageView3.image = image3
        //添加到父视图
        imageView2.addSubview(imageView3)
        
        //显示动画
        //<UIImage>是泛型，表示数组里面存放的只能是UIImage类型的对象
        var array:Array<UIImage> = Array()
        for var i=1;i<=12;i++ {
            let str = "player\(i)"
            let image = UIImage(named: str)
            array.append(image!)
        }
        
        //创建图片视图对象
        let imageView4 = UIImageView(frame: CGRectMake(160, 360, 40, 40))
        //设置动画间隔
        imageView4.animationDuration = 1
        //设置动画数据
        imageView4.animationImages = array
        //添加到父视图
        imageView1.addSubview(imageView4)
        //开始动画
        imageView4.startAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

