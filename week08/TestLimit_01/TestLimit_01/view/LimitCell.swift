//
//  LimitCell.swift
//  TestLimit_01
//
//  Created by gaokunpeng on 16/1/15.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class LimitCell: UITableViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var shareLabel: UILabel!
    
    @IBOutlet weak var favoriteLabel: UILabel!

    @IBOutlet weak var myStarView: StarView!
    
    @IBOutlet weak var downloadLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    //显示数据
    func configModel(model: LimitModel,index: NSInteger) {
        //背景图片
        //cate_list_bg1
        if index % 2 == 0 {
            self.bgImageView.image = UIImage(named: "cate_list_bg1")
        }else {
            self.bgImageView.image = UIImage(named: "cate_list_bg2")
        }
        //头像
        let url = NSURL(string: model.iconUrl!)
        self.leftImageView.kf_setImageWithURL(url!)
        
        //标题
        let titleStr = "\(index+1).\(model.name!)"
        self.titleLabel.text = titleStr
        
        //时间
        //"2016-01-16 02:30:02.0"
        //"2016-01-16 02:30:02"
        //去掉时间字符串后面的小数
        var index = model.expireDatetime?.endIndex
        for var i=0;i<2;i++ {
            index = index?.predecessor()
        }
        let dateStr = model.expireDatetime?.substringToIndex(index!)
        
        //转换成日期对象
        let df = NSDateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let expireDate = df.dateFromString(dateStr!)
        
        //计算时间差
        //日历对象
        let cal = NSCalendar.currentCalendar()
        
        let unit = NSCalendarUnit(rawValue: NSCalendarUnit.Hour.rawValue | NSCalendarUnit.Minute.rawValue | NSCalendarUnit.Second.rawValue)
        /*
        第一个参数:时间差包含哪些部分(年、月、日、时、分、秒)
        第二个参数:开始时间
        第三个参数:结束时间
        第四个参数:选项(0)
        */
        //NSDate()：获取当前时间
        let com = cal.components(unit, fromDate: NSDate(), toDate: expireDate!, options: NSCalendarOptions(rawValue: 0))
        //时间差字符串
        let timeStr = String(format: "剩余:%02d:%02d:%02d", arguments: [com.hour,com.minute,com.second])
        self.timeLabel.text = timeStr
        
        //原价
        self.priceLabel.text = model.lastPrice
        
        //星级
        self.myStarView.setRating(Float(model.starCurrent!)!)
        
        //类型
        self.categoryLabel.text = MyUtil.transferCateName(model.categoryName!)
        //分享
        self.shareLabel.text = "分享:\(model.shares!)次"
        //收藏
        self.favoriteLabel.text = "收藏:\(model.favorites!)次"
        //下载
        self.downloadLabel.text = "下载:\(model.downloads!)次"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
