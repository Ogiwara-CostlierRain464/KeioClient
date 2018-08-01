//
//  Index.swift
//  KeioClient
//
//  Created by 荻原湧志 on 2018/05/03.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import Foundation

struct Index: Codable{
    let me: Me
    let messages: [Message]
}

