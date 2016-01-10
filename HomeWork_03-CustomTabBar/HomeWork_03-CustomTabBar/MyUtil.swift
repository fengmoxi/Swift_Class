//
//  MyUtil.swift
//  HomeWork_03-CustomTabBar
//
//  Created by 风漠兮 on 16/1/10.
//  Copyright © 2016年 风漠兮. All rights reserved.
//

import UIKit

class MyUtil: NSObject {
    
    class func createImageView(frame:CGRect,imageName:String?) -> UIImageView {
        
        let imgView = UIImageView(frame: frame)
        imgView.image = UIImage(named: imageName!)
        
        return imgView
    }
    
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