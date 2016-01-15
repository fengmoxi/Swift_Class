//
//  SearchViewController.swift
//  TestLimit
//
//  Created by gaokunpeng on 15/12/8.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

enum SearchType {
    case SearchTypeLimit
    case SearchTypeReduce
    case SearchTypeFree
    case SearchTypeSubject
    case SearchTypeRank
}

class SearchViewController: BaseViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource,MyDownloaderDelegate {
    
    
    //数据源数组
    private lazy var dataArray = NSMutableArray()
    
    //表格
    var tbView: UITableView?
    
    //类型
    var type: SearchType?
    
    //分页
    var curPage: NSInteger = 1
    
    //搜索关键字
    var keyword: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //创建表格
        self.createTableView()
        
        //搜索条
        self.createSearch()
        
    }
    
    //搜索框
    func createSearch(){
        let searchBar = UISearchBar(frame: CGRectMake(0,0,kScreenW,40))
        searchBar.searchBarStyle = UISearchBarStyle.Default
        searchBar.delegate = self
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
        
        
        var urlString: String?
        if self.type == .SearchTypeLimit {
            urlString = String(format: kLimitSearchUrl, arguments: [self.curPage,self.keyword!])
        }else if self.type == .SearchTypeReduce {
            urlString = String(format: KReduceSearchUrl, arguments: [self.curPage,self.keyword!])
        }else if self.type == .SearchTypeFree {
            urlString = String(format: kFreeSearchUrl, arguments: [self.curPage,self.keyword!])
        }else if self.type == .SearchTypeRank {
            urlString = String(format: kRankSearchUrl, arguments: [self.curPage,self.keyword!])
        }
        
        let downloader = MyDownloader()
        downloader.delegate = self
        downloader.downloadWithUrlString(urlString!)
        
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
        return (self.dataArray.count)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if self.type == SearchType.SearchTypeLimit {
            //重用Id
            let limitCellId = "limitCellId"
            
            //获取cell
            var cell: LimitCell? = tableView.dequeueReusableCellWithIdentifier(limitCellId) as? LimitCell
            
            if nil == cell {
                cell = NSBundle.mainBundle().loadNibNamed("LimitCell", owner: nil, options: nil).last as? LimitCell
            }
            
            
            //显示数据
            let model = self.dataArray[indexPath.row] as! LimitModel
            cell?.configModel(model, index: indexPath.row+1, cutLength: 0)
            
            return cell!
        }else if self.type == SearchType.SearchTypeReduce {
            //重用Id
            let cellId = "reduceCellId"
            
            //获取cell
            var cell: ReduceCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? ReduceCell
            
            if nil == cell {
                cell = NSBundle.mainBundle().loadNibNamed("ReduceCell", owner: nil, options: nil).last as? ReduceCell
            }
            
            
            //显示数据
            let model = self.dataArray[indexPath.row] as! LimitModel
            cell?.config(model, index: indexPath.row+1)
            
            return cell!
        }else if self.type == SearchType.SearchTypeFree {
            //重用Id
            let cellId = "freeCellId"
            
            //获取cell
            var cell: FreeCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? FreeCell
            
            if nil == cell {
                cell = NSBundle.mainBundle().loadNibNamed("FreeCell", owner: nil, options: nil).last as? FreeCell
            }
            
            
            //显示数据
            let model = self.dataArray[indexPath.row] as! LimitModel
            cell?.configModel(model, index: indexPath.row+1)
            
            return cell!
        }else {
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
        
        self.curPage = 1
        
        self.downloadData()
        
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
