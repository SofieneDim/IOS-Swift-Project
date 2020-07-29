//
//  ViewController.swift
//  EPii
//
//  Created by Dimessi on 9/18/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit
import CommonCrypto

class ConnexionViewController: UIViewController, Actions, NetworkFail, SessionExpiredView {
    
    let testMode = true
    
    var actualityArray = [String:String] ()
    let connexionView = ConnexionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = connexionView
        connexionView.delegate = self
    }
    
    func connexion(adress: String, password: String) {
        
        connexionView._darkView.isHidden = false
        connexionView.spinnerImage.isHidden = false
        
        let apiManager: ApiManagerProtocol
        if testMode {
            apiManager = FakeApiManager()
        } else {
            apiManager = ApiManager()
        }
        
        apiManager.connexionRequest(completion: { [weak self] (data, error) in
            if error != nil {
                print(error!)
                return
            }
            if let data = data {
                self?.actualityArray = data
                let containerVC = ContainerViewController()
                containerVC.token = data["token"] ?? ""
                containerVC.userId = data["userId"] ?? ""
                containerVC.roleId = data["roleId"] ?? ""
                self?.connexionView._darkView.isHidden = true
                self?.connexionView.spinnerImage.isHidden = true
                let homeNavVC = HomeNavigationController(rootViewController: containerVC)
                self?.present(homeNavVC, animated: true, completion: nil)
            }
        }, adress: adress, password: password)
    }
    
    func inscription() {
        print("inscription")
    }
    
    func passwordF() {
        print("passwordF")
    }
    
    func annulerP() {
        connexionView._darkView.isHidden = true
        connexionView.spinnerImage.isHidden = true
        connexionView.alertView.removeFromSuperview()
    }
    
    func réessayerP() {
        connexionView.alertView.removeFromSuperview()
        connexion(adress: "azer@anypli.com", password: "ddqqqcws")
    }
    
    func dismissAlert() {
        connexionView.session.removeFromSuperview()
        self.connexionView._darkView.isHidden = true
        self.connexionView.spinnerImage.isHidden = true
    }
}

