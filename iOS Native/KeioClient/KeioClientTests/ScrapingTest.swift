//
//  RxTest.swift
//  KeioClientTests
//  Created by 荻原湧志 on 2018/05/04.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import XCTest
import Fuzi
@testable import KeioClient

class ScrapingTest : XCTestCase{
    
    var html: String? = nil
    
    override func setUp() {
        let fileUrl = URL(fileURLWithPath: ((#file as NSString).deletingLastPathComponent as NSString).appendingPathComponent("portal.html"))
        let data = try! Data(contentsOf: fileUrl)
        html = String(data: data, encoding: .utf8)!
    }
    
    func ntestPortal(){
        let obj = try! Scraping.shared.portal(html!)
        
        print(obj)
        assert(obj.me.name.contains("荻原"))
    }
    
    func testScraping(){
        let document = try! XMLDocument(string: html!)
        print(document.firstChild(css: ".info .clearfix")!.firstChild(css: "article")!.firstChild(css: "h3 a")!.stringValue) //OK!
    }
}
