//
//  ViewController.swift
//  TestUIWebView
//
//  Created by gaokunpeng on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let webView = UIWebView(frame: CGRectMake(0,20,375,667-20))
        self.view.addSubview(webView)

        
        //加载网页数据
        let urlString = "http://www.baidu.com"
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

