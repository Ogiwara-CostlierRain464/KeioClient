//
//  UserData+CoreDataProperties.swift
//  
//
//  Created by 荻原湧志 on 2018/05/05.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?

}
