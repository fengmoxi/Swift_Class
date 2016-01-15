//
//  DBManager.swift
//  TestDataBase
//
//  Created by gaokunpeng on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import CoreData

class DBManager: NSObject {
    
    //数据库操作对象
    var ctx: NSManagedObjectContext?
    
    static let manager = DBManager()
    
    //单例：在整个程序运行过程中，只会创建一个对象
    //在普通方法前面加上class，表示是类方法
    //类方法只能使用类名来调用
    class func sharedManager() -> DBManager {
        return manager
    }
    
    override init() {
        //初始化数据库对象
        super.init()
        
        self.createDataBase()
    }
    
    func createDataBase() {
        
        //1.创建对应的模型文件对象
        let path = NSBundle.mainBundle().pathForResource("User", ofType: "momd")
        let url = NSURL(fileURLWithPath: path!)
        
        let model = NSManagedObjectModel(contentsOfURL: url)
        
        //2.关联数据库文件
       let filePath = NSHomeDirectory().stringByAppendingString("/Documents/usertable.sqlite")
        let coor = NSPersistentStoreCoordinator(managedObjectModel: model!)
        
        let fileUrl = NSURL(fileURLWithPath: filePath)
        //将模型文件和数据库文件关联
        /*
        第一个参数:类型
        第二个参数:配置信息(只在数据库文件升级的时候使用)
        第三个参数:数据库文件的路径
        第四个参数:选项(nil)
        */
        //try!表示会有异常
        try! coor.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: fileUrl, options: nil)
        
        
        //3.创建数据库操作对象
        self.ctx = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
        self.ctx?.persistentStoreCoordinator = coor
        
    }
    
    
    //插入一条数据
    func insertUser(dict: Dictionary<String,AnyObject>) {
        
        /*
        第一个参数:类名
        第二个参数:数据库操作的上下文对象
        */
        let entity = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: self.ctx!) as! User
        if dict.keys.contains(kId) {
            entity.id = dict[kId] as? NSNumber!
        }
        if dict.keys.contains(kName) {
            entity.name = dict[kName] as? String
        }
        
        //保存
        try! self.ctx?.save()
    }
    
    
    //查询的方法
    func searchAllUsers() -> [User] {
        
        /*
        第一个参数:类名
        第二个参数:上下文对象
        */
        let entity = NSEntityDescription.entityForName("User", inManagedObjectContext: self.ctx!)
        
        //查询对象
        let request = NSFetchRequest()
        request.entity = entity
        
        /*
        try{}catch(Exception e){}finally{}
        */
        let result = try! self.ctx?.executeFetchRequest(request) as! [User]
        return result
    }
    
    
    //修改数据
    func updateUser(dict:Dictionary<String,AnyObject>, userId: NSNumber) {
        
        //查询到符合条件的数据
        //修改对象的属性值
        let entity = NSEntityDescription.entityForName("User", inManagedObjectContext: self.ctx!)
        
        //查询对象
        let request = NSFetchRequest()
        request.entity = entity
        
        //查询条件
        let predict = NSPredicate(format: "id == %@", userId)
        request.predicate = predict
        
        //获取查询结果值
        let ret = try! self.ctx?.executeFetchRequest(request) as! [User]
        for u in ret {
            //修改属性值
            if dict.keys.contains(kName) {
                u.name = dict[kName] as? String
            }
        }
        
        //保存
        try! self.ctx?.save()
        
    }
    
    //删除方法
    func deleteUser(u: User) {
        
        self.ctx?.deleteObject(u)
        
        //保存
        try! self.ctx?.save()
        
    }
    

}
