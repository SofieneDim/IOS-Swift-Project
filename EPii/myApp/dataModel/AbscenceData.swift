//
//  AbscenceData.swift
//  EPii
//
//  Created by Dimessi on 10/2/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import Foundation

class AbscencesData: Codable {
    
    var total_absences: Int?
    var all_teached_seances: String?
    var percent: Float?
    var userSubjectAbsencesList: [UserSubjectAbsencesLists]?
    
}

class UserSubjectAbsencesLists: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case subjectId = "subject_id"
        case subjectName = "subject_name"
        case type
        case userId = "user_id"
        case absencesByObject
        case totalTeachedSubject
        case absencePercent
        case subjectAbsencesLists = "userSubjectAbsencesList"
    }
    
    var id: Int?
    var subjectId: Int?
    var subjectName: String?
    var type: String?
    var userId: Int?
    var absencesByObject: Int?
    var totalTeachedSubject: String?
    var absencePercent: Int?
    var subjectAbsencesLists: [SubjectAbsencesList]
}

class SubjectAbsencesList: Codable {

    var id: Int?
    var user_id: Int?
    var date: String?
    var seance_id: Int?
    var duration: Int?
    var start_date: String?
    var end_date: String?
    var class_id: Int?
}
