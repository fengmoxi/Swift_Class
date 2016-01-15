//
//  SubjectCell.swift
//  TestLimit
//
//  Created by gaokunpeng on 15/12/10.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

protocol SubjectCellDelegate: NSObjectProtocol {
    func didClickAppItem(item: AppItem)
}

class SubjectCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subjectImageView: UIImageView!
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    
    var appItems: Array<AppItem> = Array()
    
    var delegate: SubjectCellDelegate?
    
    //显示数据
    func configModel(model: SubjectModel) {
        
        self.appItems = model.appArray
        
        //删除之前
        for sub in self.contentView.subviews {
            if sub is AppButton {
                sub.removeFromSuperview()
            }
        }
        
        
        //名字
        self.nameLabel.text = model.title
        //图片
        self.subjectImageView.kf_setImageWithURL(NSURL(string: model.img!)!)
        //描述图片
        self.appImageView.kf_setImageWithURL(NSURL(string: model.desc_img!)!)
        //描述
        self.descLabel.text = model.desc
        self.descLabel.numberOfLines = 0
        
        //app
        for var i=0;i<model.appArray.count;i++ {
            
            let item = model.appArray[i]
            
            let btn = AppButton(frame: CGRectMake(170,CGFloat(40+48*i),190,44))
            btn.configItem(item)
            btn.tag = 1000+i
            btn.addTarget(self, action: "clickBtn:", forControlEvents: UIControlEvents.TouchUpInside)
            self.contentView.addSubview(btn)
            
        }
        
        
        
        
    }
    
    
    func clickBtn(btn: AppButton) {
        
        let index = btn.tag - 1000
        
        let item = self.appItems[index]
        
        
        self.delegate?.didClickAppItem(item)
        
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



class AppButton: UIControl {
    
    //图片
    var imageView: UIImageView?
    //标题
    var nameLabel: UILabel?
    //评价
    var ratingLabel: UILabel?
    //下载量
    var downloadLabel: UILabel?
    //星级
    var myStarView: StarView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //图片
        self.imageView = MyUtil.createImageView(CGRectMake(0,0,50,44), imageName: nil)
        self.addSubview(self.imageView!)
        
        //标题
        self.nameLabel = MyUtil.createLabel(CGRectMake(60, 0, 100, 10), title: nil, font: UIFont.systemFontOfSize(8), textAlignment: NSTextAlignment.Left, textColor: UIColor.blackColor())
        self.addSubview(self.nameLabel!)
        
        //专题
        let topicImageView = MyUtil.createImageView(CGRectMake(60,10,10,10), imageName: "topic_Comment")
        self.addSubview(topicImageView)
        
        self.ratingLabel = MyUtil.createLabel(CGRectMake(70,10,60,10), title: nil, font: UIFont.systemFontOfSize(8), textAlignment: NSTextAlignment.Left, textColor: UIColor.blackColor())
        self.addSubview(self.ratingLabel!)
        
        //下载
        let downloadImageView = MyUtil.createImageView(CGRectMake(130, 10, 10, 10), imageName: "topic_Download")
        self.addSubview(downloadImageView)
        
        self.downloadLabel = MyUtil.createLabel(CGRectMake(140,10,50,10), title: nil, font: UIFont.systemFontOfSize(8), textAlignment: NSTextAlignment.Left, textColor: UIColor.blackColor())
        self.addSubview(self.downloadLabel!)
        
        //星级
        self.myStarView = StarView(frame: CGRectMake(60,20,65,23))
        self.myStarView?.backgroundColor = UIColor.clearColor()
        self.addSubview(self.myStarView!)
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //显示数据
    func configItem(item: AppItem) {
        //图片
        self.imageView?.kf_setImageWithURL(NSURL(string: item.iconUrl!)!)
        //标题
        self.nameLabel?.text = item.name
        //评价
        self.ratingLabel?.text = item.ratingOverall
        //下载
        self.downloadLabel?.text = item.downloads
        //星级
        self.myStarView?.setRating(CGFloat((item.starOverall! as NSString).floatValue))
        
        
        
    }
    
    
    
    
    
    
    
    
    
}
