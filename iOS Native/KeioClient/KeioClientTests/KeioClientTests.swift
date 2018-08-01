//
//  KeioClientTests.swift
//  KeioClientTests
//
//  Created by 荻原湧志 on 2018/04/30.
//  Copyright © 2018 ogiwara. All rights reserved.
//

import XCTest
import WebKit
@testable import KeioClient

class KeioClientTests: XCTestCase, WKNavigationDelegate {
    
    //var repo: AuthReopsitory!
    let web = WKWebView()
    
    func testLogin(){
        web.navigationDelegate = self
        web.load(URLRequest(url: URL(string: Url.portal.rawValue)!))
        
        WKWebsiteDataStore.default().httpCookieStore.getAllCookies { cookies in
            let mapedCookies = cookies.map { cookie in
                return Cookie(name: cookie.name, value: cookie.value)
            }
            
            let jsonString = String(data: try! JSONEncoder().encode(mapedCookies), encoding: .utf8)
            
            /*
             Alamofire.request(Url.LocalWrapper.rawValue, method: .post, parameters: ["cookie": jsonString])
             */
            
            print("Cookie: \(String(describing: jsonString))")
        }
        
        assert(true)
    }
    
    /*
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Access to \(webView.url!.absoluteString)")
        StateRepository.instance.state = .login
    }*/
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        web.evaluateJavaScript("""
form = document.forms.login;
form.j_username.value = "";
form.j_password.value = "";
login = document.getElementsByName("_eventId_proceed")[0];
login.click();
""")
    }
    
    
    
}
