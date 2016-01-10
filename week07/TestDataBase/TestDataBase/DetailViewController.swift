//
//  DetailViewController.swift
//  TestDataBase
//
//  Created by gaokunpeng on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //如果有值，表示是修改界面
    //否则是添加界面
    var user: User?
    

    //连接属性到类文件
    //1.选中界面上的控件
    //2.按住ctrl键
    //3.将控件向类文件里面拖拽,到类文件里面时，松手后，在弹出的界面框里填写属性名字
    //4.点击connect按键就可以了
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    //按钮的响应事件连接到类文件里面
    //1.选中界面上的控件
    //2.按住ctrl键
    //3.将控件向类文件里面拖拽,到类文件里面时，松手后，在弹出的界面框里修改为Action类型，然后填写方法名字
    //4.点击connect按键就可以了
    @IBOutlet weak var imageBtn: UIButton!
    
    @IBOutlet weak var idTextField: UITextField!
    //按钮的响应事件连接到类文件里面
    //1.选中按钮
    //2.右击，在显示的界面里面选择TouchUpInside后面的圆圈,显示加号后，将鼠标连向类文件里面，松手后，填写方法名
    //3.点击connect按钮就可以
    @IBAction func selectImage(sender: AnyObject) {
        
        let imageCtrl = UIImagePickerController()
        //设置为相册选择图片
        imageCtrl.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        //设置代理
        imageCtrl.delegate = self
        //显示选择界面
        self.presentViewController(imageCtrl, animated: true) { () -> Void in
            
        }
        
        
    }
    
    //保存
    @IBAction func saveAction(sender: UIButton) {
        
        var dict = Dictionary<String,AnyObject>()
        //id
        let idValue = Int(self.idTextField.text!)
        if idValue != nil {
            dict[kId] = NSNumber(integer: idValue!)
        }
        //name
        dict[kName] = self.nameTextField.text
        //age
        let ageValue = Int(self.ageTextField.text!)
        if ageValue != nil {
            dict[kAge] = NSNumber(integer: ageValue!)
        }
        //图片
        let image = self.imageBtn.currentBackgroundImage
        let data = UIImagePNGRepresentation(image!)
        dict[kImage] = data
        
        
        if self.user == nil {
            //保存
            DBManager.sharedManager().insertUser(dict)
            
        }else{
            //修改
            DBManager.sharedManager().updateUser(dict, userId: (self.user?.id)!)
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //设置按钮的边框
        self.imageBtn.layer.borderColor = UIColor.purpleColor().CGColor
        self.imageBtn.layer.borderWidth = 2
        
        
        //如果是修改界面
        //显示对应的数据
        if self.user != nil {
            self.idTextField.text = "\(self.user?.id)"
            self.nameTextField.text = self.user?.name
            self.ageTextField.text = "\(self.user?.age)"
            //图片
            let image = UIImage(data: (self.user?.image)!)
            self.imageBtn.setBackgroundImage(image, forState: UIControlState.Normal)
        }
        
        
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


extension DetailViewController {
    //取消选择图片
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    //选择了图片
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //获取选择的图片
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        //显示到按钮上
        self.imageBtn.setBackgroundImage(image, forState: UIControlState.Normal)
        picker.dismissViewControllerAnimated(true) { () -> Void in
            
        }
        
        
        
    }
}




