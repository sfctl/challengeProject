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
    var selectedCountry = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryLabel.text = selectedCountry
        print(selectedCountry)
        
        }

}
