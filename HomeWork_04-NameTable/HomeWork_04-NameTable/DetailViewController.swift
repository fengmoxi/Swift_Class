//
//  DetailViewController.swift
//  TestDataBase
//
//  Created by class1 on 16/1/15.
//  Copyright © 2016年 风漠兮. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var user: User?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    
    //保存
    @IBAction func saveAction(sender: UIButton) {
        
        var dict = Dictionary<String,AnyObject>()
        let idValue = Int(self.idTextField.text!)
        if idValue != nil {
            dict[kId] = NSNumber(integer: idValue!)
        }
        dict[kName] = self.nameTextField.text
        if self.user == nil {
            DBManager.sharedManager().insertUser(dict)
        }else{
            DBManager.sharedManager().updateUser(dict, userId: (self.user?.id)!)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.user != nil {
            self.idTextField.text = "\(self.user?.id)" as String
            self.nameTextField.text = self.user?.name
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






