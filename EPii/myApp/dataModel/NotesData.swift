//
//  NotesData.swift
//  EPii
//
//  Created by Dimessi on 9/24/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import Foundation

class ResultArrays: Codable, CustomStringConvertible {
    
    
    var total: Int? = 0
    var last_page: Int? = 0
    var per_page: String? = ""
    var next_page_url: String? = ""
    var prev_page_url: String? = ""
    var from: Int? = 1
    var to : Int? = 0
    
    var data = [ResultsContent]()
    
    
    var description: String {
        return "userId: \(data) token: \(total ?? 0)"
    }
}



struct ResultsContent:Codable, CustomStringConvertible {
    
    var id: Int?
    var title: String?
    var content: String?
    var img: String?
    var date: String?
    
    var description: String {
        return "title: \(title ?? ""), content: \(content ?? ""), date: \(date ?? "")"
    }
}
