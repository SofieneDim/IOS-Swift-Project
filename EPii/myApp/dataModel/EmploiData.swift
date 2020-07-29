//
//  EmploiData.swift
//  EPii
//
//  Created by Dimessi on 9/25/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import Foundation


class EmploiArrays: Codable, CustomStringConvertible {
    
    var Data = [EmploiContent]()
    var description: String {
        return "data: \(Data)"
    }
}

class EmploiContent:Codable, CustomStringConvertible {
    
    var week_start: String? = ""
    var week_end: String? = ""
    var seances = [Seance]()
    
    var description: String {
        return "week_start: \(week_start ?? ""), week_end: \(week_end ?? ""), seances: \(seances), "
    }
}

class Seance :Codable, CustomStringConvertible {
    
    var day: String? = ""
    var seances = [Seancess]()
    var description: String {
        return "day: \(day ?? ""), seances: \(seances)"
    }
}

struct Seancess :Codable, CustomStringConvertible {
    
    var seance_id: Int?
    var subject_name: String?
    var hall_name: String? 
    var first_name: String? 
    var last_name: String? 
    var start_time: String? 
    var end_time: String?
    var comment: String? 
    var was_teached: Int?
    var motif: String?
    var type: String? 
    var className: String?
    
    var description: String {
        return "seance_id: \(seance_id ?? 0), subject_name: \(subject_name ?? ""), hall_name: \(hall_name ?? ""), first_name: \(first_name ?? ""), last_name: \(last_name ?? ""), start_time: \(start_time ?? ""), end_time: \(end_time ?? ""), comment: \(comment ?? "")"
    }
}
