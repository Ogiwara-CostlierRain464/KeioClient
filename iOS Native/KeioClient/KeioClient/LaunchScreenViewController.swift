//
//  LaunchScreenViewController.swift
//  KeioClient
//
//  Created by 荻原湧志 on 2018/05/07.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if isFirstTime() {
            performSegue(withIdentifier: "segueFirstTime", sender: nil)
        }else{
            performSegue(withIdentifier: "segueSecondTime", sender: nil)
        }
    }
    
    private func isFirstTime() -> Bool{
        return false
    }
}
