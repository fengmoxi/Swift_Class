//
//  LimitModel.swift
//  TestLimit_01
//
//  Created by gaokunpeng on 16/1/15.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class LimitModel: NSObject {
    
    var applicationId: String?
    var slug: String?
    var name: String?
    
    var releaseDate: String?
    var version: String?
    var desc: String?
    
    var categoryId: NSInteger?
    var categoryName: String?
    var iconUrl: String?
    
    var itunesUrl: String?
    var starCurrent: String?
    var starOverall: String?
    
    var ratingOverall: String?
    var downloads: String?
    var currentPrice: String?
    
    var lastPrice: String?
    var priceTrend: String?
    var expireDatetime: String?
    
    var releaseNotes: String?
    var updateDate: String?
    var fileSize: String?
    
    var ipa: String?
    var shares: String?
    var favorites: String?
    
    //字典里面的key值在属性里面忘记写的时候
    //会调用这个方法
    //父类里面的实现是抛出一个异常(崩溃)
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
    /*
    "applicationId": "455680974",
    "slug": "rhythm-repeat",
    "name": "节奏重复",
    "releaseDate": "2014-07-01",
    "version": "2.3",
    "description": "界面清新简单的音乐节奏游戏。游戏的操作非常简单，只需根据提示依次点击相应的图标即可，共有三种乐曲选择。",
    "categoryId": 6014,
    "categoryName": "Game",
    "iconUrl": "http://photo.candou.com/i/114/55b07f3725eae8b3cafc9bce10d16e46",
    "itunesUrl": "http://itunes.apple.com/cn/app/rhythm-repeat/id455680974?mt=8",
    "starCurrent": "4.0",
    "starOverall": "4.0",
    "ratingOverall": "0",
    "downloads": "4222",
    "currentPrice": "0",
    "lastPrice": "12",
    "priceTrend": "limited",
    "expireDatetime": "2016-01-16 02:30:02.0",
    "releaseNotes": "Multi-Touch bug fixed",
    "updateDate": "2014-10-17 15:45:27",
    "fileSize": "16.69",
    "ipa": "1",
    "shares": "390",
    "favorites": "273"
    */

}
