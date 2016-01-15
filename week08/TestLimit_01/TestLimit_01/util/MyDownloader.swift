//
//  MyDownloader.swift
//  TestLimit_01
//
//  Created by gaokunpeng on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

//http://10.5.17.77/swift/

protocol MyDownloaderDelegate: NSObjectProtocol {
    //下载失败
    func downloadFail(downloader: MyDownloader,error: NSError)
    //下载成功
    func downloadFinish(downloader: MyDownloader)
}

class MyDownloader: NSObject {
    
    //代理属性
    var delegate: MyDownloaderDelegate?
    
    //存储下载回来的数据
    var receiveData: NSData?
    
    //下载对象
    var task: NSURLSessionDataTask?
    
    //下载的方法
    func downloadWithUrlString(urlString: String) {
        //1.创建NSURL对象
        let url = NSURL(string: urlString)
        //2.request对象
        let request = NSURLRequest(URL: url!)
        //3.session对象
        let session = NSURLSession.sharedSession()
        //4.下载对象
        /*
        第一个参数:request对象
        第二个参数:请求返回的调用代码块(回调)
        */
        self.task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            /*
            data->下载回来的二进制数据
            response->请求返回对象
            error->错误信息
            */
            
            self.receiveData = data
            
            if error != nil {
                //下载失败
                self.delegate?.downloadFail(self,error: error!)
            }else{
                //请求成功响应
                let res = response as! NSHTTPURLResponse
                //状态码为200->下载成功
                if res.statusCode == 200 {
                    //下载成功
                    self.delegate?.downloadFinish(self)
                }else{
                    self.delegate?.downloadFail(self, error: error!)
                }
                
            }
            
        })
        //开始下载
        self.task?.resume()
        
    }

}
