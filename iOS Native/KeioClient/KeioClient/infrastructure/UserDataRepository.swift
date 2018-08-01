//
//  UserDataRepository.swift
//  KeioClient
//
//  Created by 荻原湧志 on 2018/05/05.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class UserDataRepository{
    static let instance = UserDataRepository()
    private init(){}
    
    var fromPersistence: [UserData]?{
        get{
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            
            return try! context.fetch(UserData.fetchRequest()) as? [UserData]
        }
    }
}
