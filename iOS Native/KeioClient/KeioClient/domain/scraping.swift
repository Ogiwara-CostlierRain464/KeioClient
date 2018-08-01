//
//  scraping.swift
//  KeioClient
//
//  Created by 荻原湧志 on 2018/05/08.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import Foundation
import Fuzi

class Scraping{
    static let shared = Scraping()
    private init(){}
    
    func portal(_ html: String) throws -> Index{
        let document = try XMLDocument(string: html)
        let name = document.firstChild(css: ".login_info li")!.stringValue
        let me = Me(name: name)
        let messages: [Message] = document.css(".info .clearfix")[1].css("article").map {
            let title = $0.css("h3 a").first!.stringValue
            let detail = $0.firstChild(css: ".info-detail")!.stringValue
            
            return Message(title: title, detail: detail)
        }
        
        return Index(me: me, messages: messages)
    }
}


