//
//  RankViewController.swift
//  TestLimit
//
//  Created by gaokunpeng on 15/12/7.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class RankViewController: BaseViewController ,MyDownloaderDelegate,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    
    
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
        
        //搜索框
        self.createSearch()
        
        //标题
        self.addNavTitle("热榜")
        
    }
    
    //搜索框
    func createSearch(){
        let searchBar = UISearchBar(frame: CGRectMake(0,0,kScreenW,40))
        searchBar.searchBarStyle = UISearchBarStyle.Default
        searchBar.delegate = self
        self.searchBar = searchBar
        self.tbView?.tableHeaderView = searchBar
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
        
        let urlString = String(format: kRankUrl, arguments: [self.curPage])
        
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
        if result is NSDictionary {
            let dict = result as! NSDictionary
            
            let array = dict["applications"] as! NSArray
            for appDict in array {
                
                //创建模型对象
                let limitDict = appDict as! Dictionary<String,AnyObject>
                
                let model = LimitModel()
                model.setValuesForKeysWithDictionary(limitDict)
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
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //重用Id
        let cellId = "rankCellId"
        
        //获取cell
        var cell: RankCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? RankCell
        
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("RankCell", owner: nil, options: nil).last as? RankCell
        }
        
        
        //显示数据
        let model = self.dataArray[indexPath.row] as! LimitModel
        cell?.configModel(model, index: indexPath.row+1)
        
        return cell!
        
    }
    
    
    
    //搜索框代理
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        
        searchBar.showsCancelButton = true
        
        let sub = searchBar.subviews.last
        for tmpView in (sub?.subviews)! {
            if tmpView is UIButton {
                let btn = tmpView as! UIButton
                btn.setTitle("取消", forState: UIControlState.Normal)
                btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                btn.titleLabel?.font = UIFont.systemFontOfSize(10)
                
            }
            
        }
        
        
        return true
    }
    
    
    //点击取消按钮
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    
    //点击搜索
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        let searchCtrl = SearchViewController()
        
        searchCtrl.type = .SearchTypeRank
        
        searchCtrl.keyword = self.searchBar?.text
        
        self.navigationController?.pushViewController(searchCtrl, animated: true)
        
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
