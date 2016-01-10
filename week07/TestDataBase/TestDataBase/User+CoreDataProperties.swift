//
//  User+CoreDataProperties.swift
//  TestDataBase
//
//  Created by gaokunpeng on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

//字典key值对应的常量
public let kId = "id"
public let kName = "name"
public let kAge = "age"
public let kImage = "image"

extension User {

    @NSManaged var name: String?
    @NSManaged var age: NSNumber!
    @NSManaged var image: NSData?
    @NSManaged var id: NSNumber!

}
