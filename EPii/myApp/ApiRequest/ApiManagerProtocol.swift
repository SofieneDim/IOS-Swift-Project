//
//  ApiManagerProtocol.swift
//  EPii
//
//  Created by Dimessi on 10/31/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import Foundation

protocol ApiManagerProtocol {
    func getActuality(completion:@escaping ([resultsContent]?, Error?) -> ())
    func connexionRequest(completion:@escaping([String:String]?, Error?) -> (), adress: String, password: String)
    func notesRequest(completion:@escaping([ResultsContent]?, Error?) -> ())
    func emploiRequest(completion:@escaping([EmploiContent]?, Error?) -> (), userId: String, currentMonth: String, currentYear: String)
    func emploiResendRequest(completion:@escaping([EmploiContent]?, Error?) -> (), userId: String, month: String, year: String)
    
}
