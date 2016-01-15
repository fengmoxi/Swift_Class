//
//  BaseViewController.swift
//  TestLimit
//
//  Created by gaokunpeng on 15/12/3.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class BaseViewController: LFNavViewController/*,UITableViewDelegate, UITableViewDataSource*/ {
    
    
//    //数据源数组
//    var dataArray: NSMutableArray? {
//        get {
//            if nil == self.dataArray {
//                self.dataArray = NSMutableArray()
//            }
//            return self.dataArray
//        }
//        set {
//            
//        }
//    }
//    
//    //表格
//    var tbView: UITableView?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //创建表格视图
  //  func createTableView() {
        
//        self.automaticallyAdjustsScrollViewInsets = false
//        
//        self.tbView = UITableView(frame: CGRectMake(0, 64, kScreenW, kScreenH-64), style: UITableViewStyle.Plain)
//        self.tbView?.delegate = self
//        self.tbView?.dataSource = self
//        self.view.addSubview(self.tbView!)
        
        
 //   }
    
    //UITableView的代理
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("子类必须实现代理方法")
//        return 0
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        print("子类必须实现代理方法")
//        return nil
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
