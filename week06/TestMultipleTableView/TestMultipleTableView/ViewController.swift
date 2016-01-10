//
//  ViewController.swift
//  TestMultipleTableView
//
//  Created by gaokunpeng on 15/12/25.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    //数据源数组
    //lazy:懒加载的方式初始化数据源数组
    lazy var dataArray: NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //数据源
        self.createData()
        //表格
        self.createTableView()
        
        
    }
    
    //初始化数据源
    func createData() {
        
        for var i=65;i<91;i++ {
            //循环创建26个子数组
            let sectionArray = NSMutableArray()
            
            //每一个子数组有20条数据
            for var j=0;j<20;j++ {
                //将ASCALL码转换成对应的字符
                let c = Character(UnicodeScalar(i))
                
                let str = "第\(c)组第\(j)个数据"
                sectionArray.addObject(str)
            }
            
            self.dataArray.addObject(sectionArray)
            
        }
        
    }
    
    //创建表格
    func createTableView() {
        
        //所有滚动视图显示在导航视图控制器里面的时候
        //系统自动修改了它的上下左右间距
        
        //取消间距的修改
        self.automaticallyAdjustsScrollViewInsets = false
        
        let tbView = UITableView(frame: CGRectMake(0, 64, 375, 667-64), style: UITableViewStyle.Plain)
        tbView.delegate = self
        tbView.dataSource = self
        self.view.addSubview(tbView)
        
        //数据源修改之后，重新显示数据
        //tbView.reloadData()
        //tbView.reloadSections(<#T##sections: NSIndexSet##NSIndexSet#>, withRowAnimation: <#T##UITableViewRowAnimation#>)
        //tbView.reloadRowsAtIndexPaths(<#T##indexPaths: [NSIndexPath]##[NSIndexPath]#>, withRowAnimation: <#T##UITableViewRowAnimation#>)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//类的扩展
//是对原来类的一个补充
//UITableView的代理方法
extension ViewController {
    //多分组有多少个组
    //单分组的这个方法默认返回了1
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    
    //每个组有多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //获取子数组
        let sectionArray = self.dataArray[section] as! NSArray
        return sectionArray.count
    }
    
    //返回每一行的视图
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //重用Id
        let cellId = "cellId"
        
        //从重用队列里面获取cell
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        //获取不到，创建新的cell
        if nil == cell {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        //显示数据
        //indexPath:section  row
        let sectionArray = self.dataArray[indexPath.section] as! NSArray
        cell?.textLabel?.text = sectionArray[indexPath.row] as? String
        
        return cell!
        
        
    }
    
    //给每个分组添加标题
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //显示哪一个组
        let c = Character(UnicodeScalar(section+65))
        return "第\(c)组"
    }
    
    //给每个分组添加结束标记
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let c = Character(UnicodeScalar(section+65))
        return "第\(c)组结束"
    }
    
    //修改行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    //点击(选中)cell的事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("第\(indexPath.section)组第\(indexPath.row)行")
    }
    //取消选中
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print("取消第\(indexPath.section)组第\(indexPath.row)行")
    }
    
    
}

