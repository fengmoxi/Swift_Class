//
//  ViewController.swift
//  TestLimit_01
//
//  Created by gaokunpeng on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,MyDownloaderDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //测试网络请求数据
        let downloader = MyDownloader()
        downloader.delegate = self
        
        let str = String(format: kLimitUrl, arguments: [1])
        downloader.downloadWithUrlString(str)
    }
    
    func downloadFail(downloader: MyDownloader, error: NSError) {
        print("error")
    }
    
    
    func downloadFinish(downloader: MyDownloader) {
        //获取下载数据
        //downloader.receiveData
        
        //JSON数据
        /*
        第一个参数:需要解析的二进制数据
        第二个参数:解析的类型(MutableContainers表示最外层是字典或者数组)
        */
        let result = try! NSJSONSerialization.JSONObjectWithData(downloader.receiveData!, options: NSJSONReadingOptions.MutableContainers)
        if result is Dictionary<String,AnyObject> {
            print("%@",result)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

