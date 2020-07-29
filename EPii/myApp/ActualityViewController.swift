//
//  actualiteViewController.swift
//  EPii
//
//  Created by Dimessi on 9/18/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class ActualityViewController: UIViewController, SelectedItem, SessionExpiredView {
    
    let testMode = true
    
    var token: String = ""
    var actualityResults = [resultsContent]()
    var indexpath = 0
    let actualityView = ActualityView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        actualityView.delegate = self
        view = actualityView
        
        let apiManager: ApiManagerProtocol
        if testMode {
            apiManager = FakeApiManager()
        } else {
            apiManager = ApiManager()
        }

        apiManager.getActuality { [weak self] (data, error) in
            if error != nil {
              print("there was an error")
              return
            }
            if let data = data {
                self?.actualityResults = data
                self?.actualityView.actualityResults = data
                self?.actualityView.tableView.reloadData()
                self?.actualityView.tableView.isHidden = false
            }
        }
    }
    
    func dismissAlert() {
        dismiss(animated: false, completion: nil)
    }
    
    func itemSelected(item: resultsContent){
        let actualityDetail = ActualityDetailViewController()
        actualityDetail.item = item
        navigationController?.pushViewController(actualityDetail, animated: true)
    }
   
}
