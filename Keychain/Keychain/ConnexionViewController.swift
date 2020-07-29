//
//  ViewController.swift
//  Keychain
//
//  Created by Dimessi on 10/22/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit
    
class ConnexionViewController: UIViewController, Actions {
    
    let connexionView = ConnexionView()
    var secureStoreWithGenericPwd: SecureStore!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = connexionView
        connexionView.delegate = self
    }
    
    func AddAccount(adress: String, password: String) {
        
        let genericPwdQueryable = GenericPasswordQueryable(service: "someService")
        secureStoreWithGenericPwd = SecureStore(secureStoreQueryable: genericPwdQueryable)
        
        do {
            try secureStoreWithGenericPwd.setValue(password, for: adress)
        } catch {
            print(error)
        }
    }
    
    func getPassword() {
        
        let genericPwdQueryable = GenericPasswordQueryable(service: "someService")
        secureStoreWithGenericPwd = SecureStore(secureStoreQueryable: genericPwdQueryable)
        
        do {
            let password = try secureStoreWithGenericPwd.getValue(for: "123456")
            print(password ?? "can't find password")
        } catch {
            print(error)
        }
    }
    
    func Delete() {
        
        let genericPwdQueryable = GenericPasswordQueryable(service: "someService")
        secureStoreWithGenericPwd = SecureStore(secureStoreQueryable: genericPwdQueryable)
        
        do {
            try secureStoreWithGenericPwd.removeValue(for: "123456")
        } catch {
            print(error)
        }
    }

}

