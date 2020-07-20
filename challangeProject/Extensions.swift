//
//  Extensions.swift
//  challangeProject
//
//  Created by Yasemin YEL on 16.07.2020.
//  Copyright © 2020 Sifa. All rights reserved.
//

import UIKit

extension UIView {
    func makeShadow () {
        
       // self.setImage(UIImage(named: "1"), forState: .Normal)
        self.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 2.0
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 8
        
    }
    
}


