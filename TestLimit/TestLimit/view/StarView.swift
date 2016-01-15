//
//  StarView.swift
//  TestLimit
//
//  Created by gaokunpeng on 15/12/8.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class StarView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    var bgImageView: UIImageView?
    var fgImageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.createImageView()
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
        
        self.createImageView()
    }
    
    
    //创建图片视图
    func createImageView() {
        
        //背景图片
        self.bgImageView = UIImageView(frame: self.bounds)
        self.bgImageView?.image = UIImage(named: "StarsBackground")
        self.addSubview(self.bgImageView!)
        
        
        //前景图片
        self.fgImageView = UIImageView(frame: self.bounds)
        self.fgImageView?.image = UIImage(named: "StarsForeground")
        self.addSubview(self.fgImageView!)
        
        //停靠模式
        self.fgImageView?.clipsToBounds = true
        self.fgImageView?.contentMode = UIViewContentMode.Left
        
        
    }
    
    func setRating(rating: CGFloat) {
        
        self.fgImageView?.frame = CGRectMake(0, 0, self.bounds.size.width*rating/5.0, self.bounds.size.height)
    }
        
    
    

}
