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


    @IBOutlet var selectedImageView: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var amtLabel: UILabel!
    @IBOutlet weak var blurbLabel: UILabel!
    @IBOutlet weak var byLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
  
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var endtimeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var selectedItem : ProjectModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        countryLabel.text = selectedItem?.country
        byLabel.text = selectedItem?.by
        blurbLabel.text = selectedItem?.blurb
        locationLabel.text = selectedItem?.location
        amtLabel.text = "\(selectedItem?.amtpledged)"
        titleLabel.text = selectedItem?.title
        endtimeLabel.text = selectedItem?.endtime
        urlLabel.text = selectedItem?.url
        
         selectedImageView.makeShadow()
        titleLabel.makeShadow()
        countryLabel.makeShadow()
        blurbLabel.makeShadow()
        locationLabel.makeShadow()
        amtLabel.makeShadow()
        byLabel.makeShadow()
        endtimeLabel.makeShadow()
        urlLabel.makeShadow()
        
        }

}
