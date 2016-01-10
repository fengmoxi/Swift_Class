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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //数据源
        self.createData()
        //表格
        self.createTableView()
        
        //导航上添加一个按钮
        //点击按钮，进入编辑状态
        let btn = UIBarButtonItem(title: "编辑", style: UIBarButtonItemStyle.Plain, target: self, action: "editTableView")
        self.navigationItem.rightBarButtonItem = btn
        
    }
    
    func editTableView() {
        self.tbView?.editing = true
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
    
    //设置为移动的编辑样式
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        //UITableViewCellEditingStyle(rawValue: <#T##Int#>)
        return UITableViewCellEditingStyle(rawValue:UITableViewCellEditingStyle.Delete.rawValue | UITableViewCellEditingStyle.Insert.rawValue)!
    }
    
    //移动cell的代理方法
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        //修改数据源
        let str = self.dataArray[sourceIndexPath.row]
        //删除之前位置的数据
        self.dataArray.removeObjectAtIndex(sourceIndexPath.row)
        //添加到新的位置
        self.dataArray.insertObject(str, atIndex: destinationIndexPath.row)
        //刷新表格
        self.tbView?.reloadData()
        
        
        
    }
    
}

