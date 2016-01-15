//
//  StarView.swift
//  TestLimit_01
//
//  Created by gaokunpeng on 16/1/15.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class StarView: UIView {
    
    var fgImageView: UIImageView?

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    //代码方式创建视图时调用
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.createImageView()
    }
    
    //xib文件创建视图的时候调用
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.createImageView()
    }
    
    //初始化图片
    func createImageView() {
        
        //背景图片
        let bgImageView = MyUtil.createImageViewFrame(CGRectMake(0, 0, 65, 23), imageName: "StarsBackground")
        self.addSubview(bgImageView)
        
        //前景图片
        self.fgImageView = MyUtil.createImageViewFrame(CGRectMake(0, 0, 65, 23), imageName: "StarsForeground")
        //截取视图的时候是保留左边的内容，不是整张图片压缩
        self.fgImageView?.contentMode = UIViewContentMode.Left
        self.fgImageView?.clipsToBounds = true
        self.addSubview(self.fgImageView!)
    }
    
    //设置星级
    func setRating(rating: Float) {
        self.fgImageView?.frame = CGRectMake(0, 0, CGFloat(65*rating/5), 23);
    }
    

}
