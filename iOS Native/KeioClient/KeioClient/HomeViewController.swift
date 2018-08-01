//
//  HomeViewController.swift
//  KeioClient
//
//  Created by 荻原湧志 on 2018/05/02.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import UIKit
import WebKit

class HomeViewController: UITabBarController, WKNavigationDelegate{
    let web = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        web.load(URLRequest(url: URL(string: Url.realPortal.rawValue)!))
        web.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let url = webView.url else { return }
        
        if url.absoluteString.contains(Url.realOAuth.rawValue){
            tryToLogin()
        }
        
        if url.absoluteString.contains(Url.realPortal.rawValue){
            //ログイン成功!
            storeCookieAndBackToHame()
        }
    }
    
    private func tryToLogin(){
        web.evaluateJavaScript(
            """
form = document.forms.login;
form.j_username.value = "yushiogiwara@keio.jp";
form.j_password.value = "Maiko7039";
login = document.getElementsByName("_eventId_proceed")[0];
login.click();
""")
    }
    
    private func storeCookieAndBackToHame(){
        WKWebsiteDataStore.default().httpCookieStore.getAllCookies { cookies in
            let mapedCookies = cookies.map { cookie in
                return Cookie(name: cookie.name, value: cookie.value)
            }
            
            let jsonString = String(data: try! JSONEncoder().encode(mapedCookies), encoding: .utf8)
            
            //print("Cookie: \(String(describing: jsonString))")
            
            self.pushCookies(mapedCookies)
        }
    }
    
    func pushCookies(_ cookies: [Cookie]){
        CookieRepository.shared.subject.onNext(cookies)
    }
}
