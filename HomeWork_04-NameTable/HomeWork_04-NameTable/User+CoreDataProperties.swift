//
//  User+CoreDataProperties.swift
//  TestDataBase
//
//  Created by class1 on 16/1/15.
//  Copyright © 2016年 风漠兮. All rights reserved.
//

import Foundation
import CoreData

public let kId = "id"
public let kName = "name"

extension User {

    @NSManaged var name: String?
    @NSManaged var id: NSNumber!

}
