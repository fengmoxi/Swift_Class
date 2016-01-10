//
//  ViewController.swift
//  TestDataBase
//
//  Created by gaokunpeng on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //数据源数组
    lazy var dataArray = NSMutableArray()
    
    //表格
    var tbView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //创建表格
        self.createTableView()
        
        //导航上面的添加按钮
        let btn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "gotoAddPage")
        self.navigationItem.rightBarButtonItem = btn
    }
    
    //查询数据
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        print("%d",self.dataArray.count)
        //查询数据
        let ret = DBManager.sharedManager().searchAllUsers()
        //self.dataArray.addObjectsFromArray(ret)
        self.dataArray = NSMutableArray(array: ret)
        
        //刷新表格
        /*
        第一个参数:执行的方法
        第二个参数:执行方法时传递的实参
        第三个参数:是否等方法执行完成才执行后面的语句
        */self.performSelectorOnMainThread("reloadData", withObject: nil, waitUntilDone: false)
        //print("aaa")
    }
    
    
    //在主线程刷新表格
    func reloadData() {
        self.tbView?.reloadData()
    }
    
    //进入添加界面
    func gotoAddPage() {
        
        let detailCtrl = DetailViewController()
        self.navigationController?.pushViewController(detailCtrl, animated: true)
        
    }
    
    //创建表格
    func createTableView() {
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
    //每一行的视图
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //重用标志
        let cellId = "cellId"
        //从重用队列获取cell对象
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        if nil == cell {
            //获取不到，创建新的cell
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
        }
        
        //显示数据
        let user = self.dataArray[indexPath.row] as! User
        cell?.imageView?.image = UIImage(data: user.image!)
        cell?.textLabel?.text = user.name
        cell?.detailTextLabel?.text = "年龄:\(user.age)"
        
        return cell!
    }
    
    //点击进入详情界面
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let ctrl = DetailViewController()
        //修改界面
        ctrl.user = self.dataArray[indexPath.row] as? User

        self.navigationController?.pushViewController(ctrl, animated: true)
    }
    
    //删除
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //删除操作
        
        //从数据库里面删除
        let u = self.dataArray[indexPath.row] as? User
        DBManager.sharedManager().deleteUser(u!)
        
        //数据源数组删除
        self.dataArray.removeObjectAtIndex(indexPath.row)
        //刷新表格
        self.tbView?.reloadData()
        
    }
    
}

