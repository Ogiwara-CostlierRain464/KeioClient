//
//  HomeViewController.swift
//  KeioClient
//
//  Created by 荻原湧志 on 2018/05/02.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    var cookie: [Cookie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if isNotCookieValid() {
            performSegue(withIdentifier: "segueLogin", sender: nil)
        }
    }
    
    private func isNotCookieValid() -> Bool{
        return cookie == nil
    }
}
