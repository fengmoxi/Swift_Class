//
//  SubjectViewController.swift
//  TestLimit
//
//  Created by gaokunpeng on 15/12/7.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class SubjectViewController: BaseViewController,MyDownloaderDelegate,UITableViewDelegate,UITableViewDataSource,SubjectCellDelegate{
    
    
    //表格
    var tbView: UITableView?
    
    
    //数据源数组
    private lazy var dataArray = NSMutableArray()
    
    
    //搜索条
    var searchBar: UISearchBar?
    
    
    //分页
    var curPage: NSInteger = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = NSMutableArray()
        
        //创建表格
        self.createTableView()
        
        //下载数据
        //self.downloadData()
        
        
        //标题
        self.addNavTitle("专题")
    }
    
    
    //创建表格视图
    func createTableView() {
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.tbView = UITableView(frame: CGRectMake(0, 64, kScreenW, kScreenH-64-49), style: UITableViewStyle.Plain)
        self.tbView?.delegate = self
        self.tbView?.dataSource = self
        self.view.addSubview(self.tbView!)
        
        //下拉刷新
        self.tbView?.headerView = XWRefreshNormalHeader(target: self, action: "headerAction")
        self.tbView?.headerView?.beginRefreshing()
        
        //上拉加载更多
        self.tbView?.footerView = XWRefreshAutoNormalFooter(target: self, action: "footerAction")
        
    }
    
    func headerAction(){
        self.curPage = 1
        self.downloadData()
    }
    
    func footerAction(){
        self.curPage++
        
        self.downloadData()
    }
    
    
    //下载数据
    func downloadData(){
        
        let urlString = String(format: kSubjectUrl, arguments: [self.curPage])
        
        let downloader = MyDownloader()
        downloader.delegate = self
        downloader.downloadWithUrlString(urlString)
        
    }
    
    //下载的代理方法
    func downloadFail(downloader: MyDownloader, error: NSError) {
        print(error)
    }
    
    func downloadFinish(downloader: MyDownloader) {
        
        if self.curPage == 1 {
            self.dataArray.removeAllObjects()
        }
        
        //JSON解析
        let result = try! NSJSONSerialization.JSONObjectWithData(downloader.receiveData!, options: NSJSONReadingOptions.MutableContainers)
        if result is NSArray {
            
            
            let array = result as! NSArray
            
            for tmpDict in array {
                
                let subjectDict = tmpDict as! Dictionary<String,AnyObject>
                
                let model = SubjectModel()
                model.setValuesForKeysWithDictionary(subjectDict)
                
                //app数组
                let appArray = subjectDict["applications"] as! NSArray
                for subDict in appArray {
                    let appDict = subDict as! Dictionary<String,AnyObject>
                    
                    let appModel = AppItem()
                    appModel.setValuesForKeysWithDictionary(appDict)
                    model.appArray.append(appModel)
                    
                }
                
                
                self.dataArray.addObject(model)
                
            }
            
            
            
            
            //刷新表格
            self.performSelectorOnMainThread("refresh", withObject: nil, waitUntilDone: false)
        }
        
        
    }
    
    //刷新表格
    func refresh() {
        self.tbView?.reloadData()
        
        self.tbView?.headerView?.endRefreshing()
        self.tbView?.footerView?.endRefreshing()
    }
    
    
    //表格
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //重用Id
        let cellId = "subjectCellId"
        
        //获取cell
        var cell: SubjectCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? SubjectCell
        
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("SubjectCell", owner: nil, options: nil).last as? SubjectCell
        }
        
        
        //显示数据
        let model = self.dataArray[indexPath.row] as! SubjectModel
        cell?.configModel(model)
        cell?.delegate = self
        
        return cell!
        
    }
    
    
    //SubjectCell代理
    func didClickAppItem(item: AppItem) {
        
        let detailCtrl = DetailViewController()
        self.navigationController?.pushViewController(detailCtrl, animated: true)
        
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
