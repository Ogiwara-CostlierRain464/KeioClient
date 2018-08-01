//
//  RoundedButton.swift
//  KeioClient
//
//  Created by 荻原湧志 on 2018/05/06.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RoundedButton: UIButton{
    // 角丸の半径(0で四角形)
    @IBInspectable var cornerRadius: CGFloat = 0.0
    // 枠
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        // 角丸
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = (cornerRadius > 0)
        
        // 枠線
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        
        super.draw(rect)
    }
}
