//
//  EmploiViewController.swift
//  EPii
//
//  Created by Dimessi on 9/24/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class EmploiViewController: UIViewController, SeanceClicked, SessionExpiredView, MonthChanged {
    
    let testMode = true
    
    var userId: String = ""
    var token: String = ""
    var calenderView: CalenderView?
    var currentYear = Calendar.current.component(.year, from: Date())
    var currentMonth = Calendar.current.component(.month, from: Date())
    let backView = UIView()
    let session = SessionExpired(message: "Ssession expirée")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendRequest()

        self.title = "Emploi de temps"
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Blur bg-1")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        backView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5010434503)
    }
        
    func sendRequest(){
        let apiManager: ApiManagerProtocol
        if testMode {
            apiManager = FakeApiManager()
        } else {
            apiManager = ApiManager()
        }
        apiManager.emploiRequest(completion: { (data, error) in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                self.calenderView = CalenderView(content: data, delegate: self, MonthDelegate: self)
                self.calenderView!.translatesAutoresizingMaskIntoConstraints = false
                self.view.addSubview(self.calenderView!)
                self.calenderView!.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 5).isActive = true
                self.calenderView!.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
                self.calenderView!.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
                self.calenderView!.heightAnchor.constraint(equalToConstant: 330).isActive = true
            }
        }, userId: userId, currentMonth: String(currentMonth), currentYear: String(currentYear))
    }
    
    func resendRequest(month: Int, year: Int) {
        print("httt")
    }
    
    func sessionExpired(sessionDelegate: SessionExpiredView){
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backView)
        let backTop = backView.topAnchor.constraint(equalTo: view.topAnchor)
        let backLead = backView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let backTrai = backView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let backBottom = backView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        session.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(session)
        let sessioncentreY = session.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let sessionHeight = session.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        let sessionTrai = session.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        let sessionLead = session.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        
        NSLayoutConstraint.activate([sessioncentreY, sessionHeight, sessionTrai, sessionLead, backTop, backLead, backTrai, backBottom])
        session.delegate = sessionDelegate
    }
    
    func dismissAlert() {
        dismiss(animated: false, completion: nil)
    }
    
    func itemClicked(seance: Seancess, day: [String : String], index: Int) {
        let emploiDetailVC = EDetailViewController()
        emploiDetailVC.seance = seance
        emploiDetailVC.day = day
        emploiDetailVC.index = index
        navigationController?.pushViewController(emploiDetailVC, animated: true)
    }
    
    func showNetworkError() {
        let alert = UIAlertController(title: "Whoops...", message: "There was an error accessing the iTunes Store. " + "Please try again.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
