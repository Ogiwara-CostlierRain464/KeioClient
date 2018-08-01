//
//  Cookie.swift
//  KeioClient
//
//  Created by 荻原湧志 on 2018/05/02.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import Foundation

struct Cookie: Codable{
    let name: String
    let value: String
}

extension Array where Element == Cookie{
    func encode() -> String{
        return String(data: try! JSONEncoder().encode(self), encoding: .utf8)!
    }
}

extension String{
    func toCookies() throws -> [Cookie]{
        return try JSONDecoder().decode([Cookie].self, from: self.data(using: .utf8)!)
    }
}
