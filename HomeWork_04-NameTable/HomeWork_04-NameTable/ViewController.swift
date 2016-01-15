//
//  ViewController.swift
//  HomeWork_04-NameTable
//
//  Created by class1 on 16/1/15.
//  Copyright © 2016年 风漠兮. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    lazy var dataArray = NSMutableArray()
    var tbView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.createTableView()
        let btn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "gotoAddPage")
        self.navigationItem.rightBarButtonItem = btn
    }
    
    //查询数据
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        //查询数据
        let ret = DBManager.sharedManager().searchAllUsers()
        self.dataArray = NSMutableArray(array: ret)
        self.performSelectorOnMainThread("reloadData", withObject: nil, waitUntilDone: false)
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
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        if nil == cell {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
        }
        
        let user = self.dataArray[indexPath.row] as! User
        cell?.textLabel?.text = user.name
        cell?.detailTextLabel?.text = "\(user.id)"
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let ctrl = DetailViewController()
        ctrl.user = self.dataArray[indexPath.row] as? User
        self.navigationController?.pushViewController(ctrl, animated: true)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let u = self.dataArray[indexPath.row] as? User
        DBManager.sharedManager().deleteUser(u!)
        self.dataArray.removeObjectAtIndex(indexPath.row)
        self.tbView?.reloadData()
    }
    
}


