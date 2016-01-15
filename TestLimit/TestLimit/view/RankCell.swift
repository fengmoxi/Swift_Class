//
//  RankCell.swift
//  TestLimit
//
//  Created by gaokunpeng on 15/12/9.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class RankCell: UITableViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var myStarView: StarView!
    @IBOutlet weak var cateLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var downloadLabel: UILabel!
    
    
    
    
    //显示数据
    func configModel(model: LimitModel, index: NSInteger) {
        //背景图片
        if index%2 == 0 {
            self.bgImageView.image = UIImage(named: "cate_list_bg1")
        }else{
            self.bgImageView.image = UIImage(named: "cate_list_bg2")
        }
        
        //图片
        self.leftImageView.kf_setImageWithURL(NSURL(string: model.iconUrl!)!)
        
        //名字
        self.nameLabel.text = String(format: "%ld.%@", arguments: [index, model.name!])

        //评分
        self.gradeLabel.text = String(format: "评分:%@", arguments: [model.starOverall!])
        
        //原价
        let priceStr = String(format: "￥%@", arguments: [model.currentPrice!])
        
        let attrStr = NSAttributedString(string: priceStr, attributes: [NSStrikethroughStyleAttributeName:1])
        self.priceLabel.attributedText = attrStr
        
        
        //星级
        self.myStarView.setRating(CGFloat((model.starCurrent! as NSString).floatValue))
        
        //类型
        self.cateLabel.text = MyUtil.transferCateName(model.categoryName!)
        
        //下载
        self.downloadLabel.text = String(format: "下载:%@次", arguments: [model.downloads!])
        //收藏
        self.favoriteLabel.text = String(format: "收藏:%@次", arguments: [model.favorites!])
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
