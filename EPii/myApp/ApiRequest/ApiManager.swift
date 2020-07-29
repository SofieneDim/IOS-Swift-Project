//
//  ApiManager.swift
//  EPii
//
//  Created by Dimessi on 10/31/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import Foundation

class ApiManager: ApiManagerProtocol {
    
    var token = ""
    let url = "www.exemple.com"
    
    func connexionRequest(completion:@escaping([String:String]?, Error?) -> (), adress: String, password: String){
        let session = URLSession.shared
        let url = signInURL(adress: adress, password: password)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                completion(nil, error)
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let results = self.connexionParse(data: data!)
                completion(results, nil)
            }
        })
        dataTask.resume()
    }
    
    func getActuality(completion:@escaping([resultsContent]?, Error?) -> ()){
        let session = URLSession.shared
        let url = URL(string: self.url)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "token")

        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                print("Failor ! \(error.localizedDescription)")
                completion(nil, error)
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let results = self.actualityParse(data: data!)
                DispatchQueue.main.async {
                    completion(results, nil)
                }
            }
        })
        dataTask.resume()
    }
    
    func notesRequest(completion:@escaping([ResultsContent]?, Error?) -> ()){
        let session = URLSession.shared
        let url = URL(string: self.url)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "token")
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                print("Failor ! \(error.localizedDescription)")
                completion(nil, error)
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    let results = self.notesParse(data: data!)
                    DispatchQueue.main.async {
                        completion(results, nil)
                    }
                }
            }
        })
        dataTask.resume()
    }
    
    func emploiRequest(completion:@escaping([EmploiContent]?, Error?) -> (), userId: String, currentMonth: String, currentYear: String){
        let session = URLSession.shared
        let url = URL(string: self.url + "?user_id=\(userId)&month=\(currentMonth)&year=\(currentYear)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "token")
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                completion(nil, error)
                print("Failor ! \(error.localizedDescription)")
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                let results = self.emploiParse(data: data!)
                completion(results, nil)
                }
            }
        })
        dataTask.resume()
    }
    
    func emploiResendRequest(completion:@escaping([EmploiContent]?, Error?) -> (), userId: String, month: String, year: String){
        
        let session = URLSession.shared
        let url = URL(string: self.url + "?user_id=\(userId)&month=\(month)&year=\(year)")

        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "token")

        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                   completion(nil, error)
                }
                print("Failor ! \(error.localizedDescription)")
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {

                DispatchQueue.main.async {
                    let results = self.emploiParse(data: data!)
                    completion(results, nil)
                }
            }
        })
        dataTask.resume()
    }
    
    func signInURL(adress: String, password: String) -> URL {

        //***************************
        let passwordd = "ddqqqcws"
        let adresss = "mehdydimassi1@gmail.com"
        
        let encodedPassword = passwordd.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let urlString = String(format: self.url + "?password=\(encodedPassword)&mail=%@", adresss)
        let url = URL(string: urlString)
        return url!
    }

    func connexionParse(data: Data) -> [String: String] {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(loginData.self, from: data)
            let token = result.token ?? ""
            let userId = String(result.user_id!)
            let roleId = String(result.user_id!)
            return ["token": token, "userId": userId, "roleId": roleId]
        } catch {
            print("JSON Error: \(error)")
            return [:]
        }
    }
    
    func actualityParse(data: Data) -> [resultsContent] {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(ActualityData.self, from: data)
            return result.data
        } catch {
            print("JSON Error: \(error)")
            return []
        }
    }

    func notesParse(data: Data) -> [ResultsContent] {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(ResultArrays.self, from:data)
            return result.data
        } catch {
            print("JSON Error: \(error)")
            return []
        }
    }
    
    func emploiParse(data: Data) -> [EmploiContent] {
    do {
      let decoder = JSONDecoder()
      let result = try decoder.decode(EmploiArrays.self, from:data)
        return result.Data
    } catch {
      print("JSON Error: \(error)")
        return []
      }
    }
    
    
}
