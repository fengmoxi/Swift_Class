//
//  SubjectModel.swift
//  TestLimit
//
//  Created by gaokunpeng on 15/12/10.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class SubjectModel: NSObject {
    
    var title: String?
    var date: String?
    var desc: String?
    var desc_img: String?
    var img: String?
    var appArray: Array<AppItem> = Array()
    
    /*
    "title": "三国时代（上）",
    "date": "2013-04-19",
    "desc": "小编mm推荐：每个人都有一个三国梦，让我们梦回三国，做一回真正的乱世英豪。",
    "desc_img": "http://special.candou.com/adaae50a310a85a3146ff5b6687940d7.jpg",
    "img": "http://special.candou.com/4aa9a565ab85adf851769d8f58eadbf1.jpg",
    "applications": [
    {
    "applicationId": "407413403",
    "downloads": "10526",
    "iconUrl": "http://photo.candou.com/i/114/d6ae6ff47de62c333a4a6eec01dc92bb",
    "name": "三国杀",
    "ratingOverall": "19955",
    "starOverall": "3.5"
    },
    {
    "applicationId": "411411466",
    "downloads": "798",
    "iconUrl": "http://photo.candou.com/i/114/d2865d181a804b5b9d159af047a28522",
    "name": "三国群殴传",
    "ratingOverall": "15604",
    "starOverall": "4.5"
    },
    {
    "applicationId": "445577381",
    "downloads": "1330",
    "iconUrl": "http://photo.candou.com/i/114/27159cf7d458338727c00251d7cd75b5",
    "name": "三国塔防 - 魏传",
    "ratingOverall": "36392",
    "starOverall": "4.5"
    },
    {
    "applicationId": "500601105",
    "downloads": "706",
    "iconUrl": "http://photo.candou.com/i/114/e89961ca4a9571f80a123e237f768dea",
    "name": "三国来了",
    "ratingOverall": "104662",
    "starOverall": "5"
    }
    ]
    }
    */
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }

}





class AppItem: NSObject {
    
    var applicationId: String?
    var downloads: String?
    var iconUrl: String?
    var name: String?
    var ratingOverall: String?
    var starOverall: String?
    
    /*
    "applicationId": "407413403",
    "downloads": "10526",
    "iconUrl": "http://photo.candou.com/i/114/d6ae6ff47de62c333a4a6eec01dc92bb",
    "name": "三国杀",
    "ratingOverall": "19955",
    "starOverall": "3.5"
    */
    
}











