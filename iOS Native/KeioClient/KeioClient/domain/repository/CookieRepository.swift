//
//  CookieRepository.swift
//  KeioClient
//
//  Created by 荻原湧志 on 2018/05/05.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import RxSwift

class CookieRepository{
    static let shared = CookieRepository()
    private init(){}
    
    let subject = ReplaySubject<[Cookie]>.create(bufferSize: 1)
}
