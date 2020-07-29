//
//  NotesViewController.swift
//  EPii
//
//  Created by Dimessi on 10/1/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, Notes, NetworkFail, SessionExpiredView {
    
    let testMode = true
    
    var userId = ""
    var token = ""
    var nextPage = ""
    var didEndDisplaying = false
    let noteView = NotesView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = noteView
        noteView.delegate = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.firstRequest()
        }
    }
    
    func firstRequest(){
        
        let apiManager: ApiManagerProtocol
        if testMode {
            apiManager = FakeApiManager()
        } else {
            apiManager = ApiManager()
        }
        apiManager.notesRequest { [weak self] (data, error) in
            if error != nil {
              print("there was an error")
              return
            }
            if let data = data {
                self?.noteView.content = data
                self?.noteView.tableView.reloadData()
                self?.noteView.tableView.isHidden = false
            }
        }
    }
    
    func itemSelected(item: ResultsContent) {
        
        let NDetailVC = NotesDtailsViewController()
        
        NDetailVC.dateT = item.date
        NDetailVC.contentT = item.content
        NDetailVC.titleT = item.title
        
        navigationController?.pushViewController(NDetailVC, animated: true)
    }
    
    func annulerP() {
        noteView.alertView.removeFromSuperview()
    }
    
    func réessayerP() {
        firstRequest()
    }
    func dismissAlert() {
        dismiss(animated: false, completion: nil)
    }
        
//        self.noteView.sessionExpired(sessionDelegate: self)
    
}
