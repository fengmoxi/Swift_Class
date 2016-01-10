//
//  MyUtil.swift
//  CustomTabBar
//
//  Created by gaokunpeng on 15/12/25.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class MyUtil: NSObject {
    
    //创建图片
    //class表示方法是类方法，直接用类名来调用
    class func createImageView(frame:CGRect,imageName:String?) -> UIImageView {
        
        let imgView = UIImageView(frame: frame)
        imgView.image = UIImage(named: imageName!)
        
        return imgView
    }
    
    //创建按钮
    class func createBtn(frame:CGRect, imageName:String?, selectImageName:String?,target:AnyObject?,action:Selector) -> UIButton {
        
        let btn = UIButton(type: UIButtonType.Custom)
        btn.frame = frame
        btn.setImage(UIImage(named: imageName!), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: selectImageName!), forState: UIControlState.Selected)
        //点击事件
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        return btn
        
    }
    
    

}
