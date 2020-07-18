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
    var endtime : String
    var location : String
    var percentage : Int
    var numBackers : String
    var state : String
    var title : String
    var type : String
    var url : String
    
    
    enum CodingKeys: String, CodingKey {
           case sno = "s.no"
           case amtpledged = "amt.pledged"
           case blurb
           case by
           case country
           case currency
           case endtime = "end.time"
           case location
           case percentage = "percentage.funded"
           case numBackers = "num.backers"
           case state
           case title
           case type
           case url
     }  
    
}





