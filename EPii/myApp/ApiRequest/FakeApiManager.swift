//
//  FakeApiManager.swift
//  EPii
//
//  Created by Dimessi on 10/31/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import Foundation

class FakeApiManager: ApiManagerProtocol {
    
    func connexionRequest(completion: @escaping ([String : String]?, Error?) -> (), adress: String, password: String) {
        let data = ["token": "token", "userId": "userId", "roleId": "roleId"]
        completion(data, nil)
    }
    
    func getActuality(completion: @escaping ([resultsContent]?, Error?) -> ()) {
        completion(actualityData, nil)
    }
  
    func notesRequest(completion:@escaping([ResultsContent]?, Error?) -> ()){
        completion(notesData, nil)
    }
    
    func emploiRequest(completion: @escaping ([EmploiContent]?, Error?) -> (), userId: String, currentMonth: String, currentYear: String) {
        let fakeData: [EmploiContent] = []
        completion(fakeData, nil)
    }
    
    func emploiResendRequest(completion: @escaping ([EmploiContent]?, Error?) -> (), userId: String, month: String, year: String) {
        
        print("")
    }
    
    let loremIpsum = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    
    lazy var actualityData: [resultsContent] = [
            resultsContent(id: 1234, title: "Title 1", content: loremIpsum, img: "img1", date: "01-01-2019"),
            resultsContent(id: 1234, title: "Title 2", content: loremIpsum, img: "img2", date: "02-01-2019"),
            resultsContent(id: 1234, title: "Title 3", content: loremIpsum, date: "03-01-2019"),
            resultsContent(id: 1234, title: "Title 4", content: loremIpsum, img: "img4", date: "04-01-2019"),
            resultsContent(id: 1234, title: "Title 5", content: loremIpsum, img: "img5", date: "05-01-2019"),
            resultsContent(id: 1234, title: "Title 6", content: loremIpsum, img: "img6", date: "06-01-2019"),
            resultsContent(id: 1234, title: "Title 7", content: loremIpsum, date: "07-01-2019"),
            resultsContent(id: 1234, title: "Title 8", content: loremIpsum, img: "img8", date: "08-01-2019"),
            resultsContent(id: 1234, title: "Title 9", content: loremIpsum, img: "img9", date: "09-01-2019"),
            resultsContent(id: 1234, title: "Title 10", content: loremIpsum, img: "img10", date: "10-01-2019")]
    
    lazy var notesData: [ResultsContent] = [
            ResultsContent(id: 1234, title: "title 1", content: loremIpsum, date: "01/02/2019"),
            ResultsContent(id: 1234, title: "title 2", content: loremIpsum, date: "02/02/2019"),
            ResultsContent(id: 1234, title: "title 3", content: loremIpsum, date: "03/02/2019"),
            ResultsContent(id: 1234, title: "title 4", content: loremIpsum, date: "04/02/2019"),
            ResultsContent(id: 1234, title: "title 5", content: loremIpsum, date: "05/02/2019"),
            ResultsContent(id: 1234, title: "title 6", content: loremIpsum, date: "06/02/2019"),
            ResultsContent(id: 1234, title: "title 7", content: loremIpsum, date: "07/02/2019"),
            ResultsContent(id: 1234, title: "title 8", content: loremIpsum, date: "08/02/2019"),
            ResultsContent(id: 1234, title: "title 9", content: loremIpsum, date: "09/02/2019"),
            ResultsContent(id: 1234, title: "title 10", content: loremIpsum, date: "10/02/2019"),]
}


