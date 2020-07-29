//
//  logInData.swift
//  EPii
//
//  Created by Dimessi on 9/19/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import Foundation

class loginData: Codable, CustomStringConvertible {
    
    var token: String? = ""
    var user_id: Int? = 0
    var role_id: Int? = 0
    var class_id: Int? = 0
    
    var description: String {
        return "userId: \(user_id ?? 0) token: \(token ?? "")"
    }
    
}


class ActualityData:Codable {
    
    var data = [resultsContent]()
}

struct resultsContent:Codable {
    
    var id: Int? = 0
    var title: String?
    var content: String?
    var img: String?
    
    var date: String?
    
}



    

