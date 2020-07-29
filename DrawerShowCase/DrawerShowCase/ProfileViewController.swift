//
//  ProfileViewController.swift
//  DrawerShowCase
//
//  Created by HDimes on 9/21/19.
//  Copyright © 2019 Anypli. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    weak var menuResponder: MenuResponder?

    @IBAction func showMenu() {
        menuResponder?.showMenu()
    }
    
    

}
