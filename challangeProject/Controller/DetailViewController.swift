//
//  DetailViewController.swift
//  challangeProject
//
//  Created by Yasemin YEL on 14.07.2020.
//  Copyright © 2020 Sifa. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {


    @IBOutlet weak var countryLabel: UILabel!
    var selectedItem : ProjectModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryLabel.text = selectedItem?.blurb
        
        
        
        
        }

}
