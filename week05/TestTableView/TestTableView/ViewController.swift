//
//  ViewController.swift
//  TestTableView
//
//  Created by gaokunpeng on 15/12/18.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    //数据源数组
    //用来存储表格上面显示的数据
    //通常用数组或者字典
    //lazy表示懒加载
    lazy var dataArray: Array<String> = Array()
    //weak->弱引用
    //strong->强引用

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //表格视图是一个UITableView类型的对象
        //UITableView: UIScrollView
        
        //用UITableView显示20行数据
        //MVC
        
        //1.创建数据源
        self.createDataArray()
        
        //2.创建表格视图
        /*
        第一个参数:表格的位置和大小
        第二个参数:表格的样式
        */
        let tableView = UITableView(frame: CGRectMake(0, 20, 375, 667-20), style: UITableViewStyle.Plain)
        //设置代理
        tableView.delegate = self
        //设置数据源代理
        tableView.dataSource = self
        //添加到父视图
        self.view.addSubview(tableView)
        
        //3.遵守协议，实现代理方法
        
        
        
    }
    
    //初始化数据源
    func createDataArray(){
        
        for var i=0;i<20;i++ {
            let str = String(format: "第%d条数据", arguments: [i])
            //let str2 = "第\(i)条数据"
            self.dataArray.append(str)
        }
        
    }
    
    //实现代理方法
    //返回表格有多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    //返回每一行显示的视图对象
    //每一行显示的视图是一个UITableViewCell类型或者子类型的对象
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        /*
        indexPath:
        setion:组
        row:行
        */
        
        //cell的重用机制
        
        //重用Id
        let cellId = "cellId"
        
        //先从重用队列里面获取cell
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        //获取不到，创建新的
        if nil == cell {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
            print("create")
        }
        
        
        /*
        第一个参数:cell的样式
        第二个参数:重用Id
        */
//        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
//        print("create")
        //Default:图片在左，文字在右，详情文字不显示
        //Subtitle:图片在左，文字在右，详情文字显示在文字下面
        //Value1:图片在左，文字在右，详情文字显示在右边
        //Value2:图片不显示，文字颜色为蓝色，详情文字显示在文字的后边
        
        //显示字符串
        let str = self.dataArray[indexPath.row] 
        
        //文字
        cell!.textLabel?.text = str
        //详情
        cell!.detailTextLabel?.text = "详情"
        //图片
        cell!.imageView?.image = UIImage(named: "tab_2")
        
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

