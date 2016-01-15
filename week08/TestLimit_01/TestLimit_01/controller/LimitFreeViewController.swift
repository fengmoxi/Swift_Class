//
//  LimitFreeViewController.swift
//  TestLimit_01
//
//  Created by gaokunpeng on 16/1/15.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class LimitFreeViewController: BaseViewController ,MyDownloaderDelegate, UITableViewDelegate, UITableViewDataSource{
    
    //表格
    var tbView: UITableView?
    //数组
    lazy var dataArray = NSMutableArray()
    //当前页数
    var curPage: NSInteger = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //创建表格
        self.createTableView()
        //下载
        self.downloadData()
    }
    
    //创建表格
    func createTableView() {
        self.automaticallyAdjustsScrollViewInsets = false
        self.tbView = UITableView(frame: CGRectMake(0, 64, 375, 667-64-49), style: UITableViewStyle.Plain)
        self.tbView?.delegate = self
        self.tbView?.dataSource = self
        self.view.addSubview(self.tbView!)
        
        
        //上拉加载更多
        /*
        第一个参数:上拉加载更多时调用这个对象的方法
        第二个参数:上拉加载更多时调用这个方法
        */
        self.tbView?.footerView = XWRefreshAutoNormalFooter(target: self, action: "loadMore")
        
        //下拉刷新
        self.tbView?.headerView = XWRefreshNormalHeader(target: self, action: "loadFirstPage")
        
    }
    
    //下拉刷新
    func loadFirstPage() {
        
        self.curPage = 1
        
        self.downloadData()
        
    }
    
    //加载更多
    func loadMore() {
        self.curPage++
        
        self.downloadData()
    }
    
    //刷新表格
    func refresh() {
        self.tbView?.reloadData()
        
        //结束下拉刷新
        self.tbView?.footerView?.endRefreshing()
        //结束下拉刷新
        self.tbView?.headerView?.endRefreshing()
    }
    
    //下载数据
    func downloadData() {
        
        let downloader = MyDownloader()
        downloader.delegate = self
        
        let urlString = String(format: kLimitUrl, arguments: [self.curPage])
//        if self.lastId != nil {
//            //加载跟多
//            //
//        }
        
        downloader.downloadWithUrlString(urlString)
        
    }

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


extension LimitFreeViewController {
    //下载代理方法
    //下载失败
    func downloadFail(downloader: MyDownloader, error: NSError) {
        print("%@",error)
    }
    //下载成功
    func downloadFinish(downloader: MyDownloader) {
        
        //如果是下载第一页数据
        //删除数据源数组里面之前存储的所有数据
        if self.curPage == 1 {
            self.dataArray.removeAllObjects()
        }
        
        
        //JSON解析
        let ret = try! NSJSONSerialization.JSONObjectWithData(downloader.receiveData!, options: NSJSONReadingOptions.MutableContainers)
        if ret is NSDictionary {
            let appArray = ret["applications"] as! Array<NSDictionary>
            for tmpDict in appArray {
                //转换成模型对象
                let modelDict = tmpDict as! Dictionary<String,AnyObject>
                let model = LimitModel()
                model.setValuesForKeysWithDictionary(modelDict)
                self.dataArray.addObject(model)
            }
            
            //将最后一条数据的id值赋给lastId
            //let model = self.dataArray.lastObject;
            //self.lastId = model.XXXid
            
//            //打印
//            for model in self.dataArray {
//                print("%@",model.name)
//            }
            
            //刷新表格
            //回到主线程刷新UI
            /*
            第一个参数:在主线程执行的方法名
            第二个参数:执行方法时传递的参数
            第三个参数:是否等到执行结束才开始执行当前的线程后面的代码
            */
            self.performSelectorOnMainThread("refresh", withObject: nil, waitUntilDone: false)
            
        }
        
    }
    
}


extension LimitFreeViewController {
    //UITableVie代理
    //一共多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    //行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    //每一个cell对象
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "limitCellId"
        //从重用队列里面获取
        var cell: LimitCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? LimitCell
        //获取不到，用xib方式创建cell
        if nil == cell {
            /*
            第一个参数:xib文件的名字
            第二个参数:xib对象的所有者(nil)
            第三个参数:选项(nil)
            */
            cell = NSBundle.mainBundle().loadNibNamed("LimitCell", owner: nil, options: nil).last as? LimitCell
        }
        //显示数据
        let model = self.dataArray[indexPath.row] as! LimitModel
        cell?.configModel(model, index: indexPath.row)
        
        return cell!
        
    }
    
    
}

