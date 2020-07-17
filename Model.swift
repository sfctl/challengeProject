//
//  Model.swift
//  challangeProject
//
//  Created by Yasemin YEL on 13.07.2020.
//  Copyright © 2020 Sifa. All rights reserved.
//

//import Foundation
//import Alamofire


struct ProjectModel: Codable {
    
    var sno : Int
    var amtpledged : Int
    var blurb : String
    var by : String
    var country : String
    var currency : String
    var endtime : Int
    var location : String
    var percentage : Int
    var numBackers : Int
    var state : String
    var title : String
    var type : String
    var url : String
    
    
    enum CodingKeys: String, CodingKey {
           case sno = "s.no"
           case amtpledged
           case blurb = "blurb"
           case by = "by"
           case country
           case currency
           case endtime
           case location
           case percentage
           case numBackers
           case state
           case title
           case type
           case url
     }
    
}





