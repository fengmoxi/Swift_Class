//
//  ViewController.swift
//  TestTableViewDelete
//
//  Created by gaokunpeng on 15/12/25.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    //数据源
    lazy var dataArray = NSMutableArray()
    //表格
    var tbView: UITableView?
    //删除的数组
    lazy var deleteArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //数据源
        self.createData()
        //表格
        self.createTableView()
        
        //导航上面添加按钮，进入编辑状态
        //navigationItem只有视图控制器在导航里面时才有值，否则是nil
        let btn = UIBarButtonItem(title: "编辑", style: UIBarButtonItemStyle.Plain, target: self, action: "editTableView")
        self.navigationItem.rightBarButtonItem = btn
    }
    
    func editTableView() {
        
        if (self.tbView?.editing == true) {
            //删除操作
            self.dataArray.removeObjectsInArray(self.deleteArray as [AnyObject])
            //刷新表格
            self.tbView?.reloadData()
            
            //恢复表格的状态
            self.tbView?.editing = false
            self.navigationItem.title = "编辑"
            //清空删除数组里面的内容
            self.deleteArray.removeAllObjects()
            
            
        }else{
            //进入编辑状态
            self.tbView?.editing = true
            self.navigationItem.rightBarButtonItem?.title = "删除"
        }
        
    }
    
    //数据源
    func createData() {
        for var i=0;i<50;i++ {
            let str = "第\(i+1)条数据"
            self.dataArray.addObject(str)
        }
    }
    
    //表格
    func createTableView() {
        //导航下面显示表格视图
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.tbView = UITableView(frame: CGRectMake(0, 64, 375, 667-64), style: UITableViewStyle.Plain)
        self.tbView?.delegate = self
        self.tbView?.dataSource = self
        self.view.addSubview(self.tbView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    //返回多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    //返回每一行显示的视图
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //重用标志
        let cellId = "myCellId"
        //从重用数组获取cell
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        //获取不到，创建新的cell
        if nil == cell {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        //显示数据
        cell?.textLabel?.text = self.dataArray[indexPath.row] as? String
        return cell!
    }
    
    //多行删除的样式
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle(rawValue: UITableViewCellEditingStyle.Delete.rawValue | UITableViewCellEditingStyle.Insert.rawValue)!
    }
    //删除操作
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    //添加删除数据
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //现在在编辑状态
        if self.tbView?.editing == true {
            let str = self.dataArray[indexPath.row]
            self.deleteArray.addObject(str)
        }
    }
    
    //取消删除
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if self.tbView?.editing == true {
            //从原始数据源数组里面获取对象
            let str = self.dataArray[indexPath.row]
            self.deleteArray.removeObject(str)
        }
    }
    
    
    
}

