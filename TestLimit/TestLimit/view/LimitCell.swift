//
//  LimitCell.swift
//  TestLimit
//
//  Created by gaokunpeng on 15/12/8.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class LimitCell: UITableViewCell {
    
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var lastPriceLabel: UILabel!
    
    @IBOutlet weak var myStarView: StarView!
    
    @IBOutlet weak var categoryLabel: UILabel!

   
    @IBOutlet weak var shareLabel: UILabel!
    
    @IBOutlet weak var collectLabel: UILabel!
    
    
    @IBOutlet weak var downloadLabel: UILabel!
    
    
    
    //显示数据
    func configModel(model: LimitModel, index: NSInteger,cutLength: NSInteger) {
        //背景图片
        if index % 2 == 0 {
            self.bgImageView.image = UIImage(named: "cate_list_bg1")
        }else{
            self.bgImageView.image = UIImage(named: "cate_list_bg2")
        }
        
        //图片
        let url = NSURL(string: model.iconUrl!)
        self.leftImageView.kf_setImageWithURL(url!)
        
        //名字
        self.nameLabel.text = String(format: "%ld.%@", arguments: [index,model.name!])
        
        //剩余时间
        var  index = model.expireDatetime?.endIndex
        for var i=0;i<cutLength;i++ {
            index = index?.predecessor()
        }
        let dateStr = model.expireDatetime?.substringToIndex(index!)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.dateFromString(dateStr!)
        
        
        let cal = NSCalendar.currentCalendar()
        
        let unit = NSCalendarUnit(rawValue: NSCalendarUnit.Hour.rawValue | NSCalendarUnit.Minute.rawValue | NSCalendarUnit.Second.rawValue)
        let dc = cal.components(unit, fromDate: NSDate(), toDate: date!, options: NSCalendarOptions(rawValue: 0))
        
        
        self.timeLabel.text = String(format: "剩余%02ld:%02ld:%02ld", arguments: [dc.hour,dc.minute,dc.second])
        
        //价格
        let priceStr = String(format: "￥%@", arguments: [model.lastPrice!])
        
        let attrStr = NSAttributedString(string: priceStr, attributes: [NSStrikethroughStyleAttributeName:1])
        self.lastPriceLabel.attributedText = attrStr
        
        
        //星级
        self.myStarView.setRating(CGFloat((model.starCurrent! as NSString).floatValue))
        
        //类型
        self.categoryLabel.text = MyUtil.transferCateName(model.categoryName!)
        
        //下载
        self.downloadLabel.text = String(format: "下载:%@次", arguments: [model.downloads!])
        //收藏
        self.collectLabel.text = String(format: "收藏:%@次", arguments: [model.favorites!])
        //分享
        self.shareLabel.text = String(format: "分享:%@次", arguments: [model.shares!])
        
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
