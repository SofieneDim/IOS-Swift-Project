//
//  HomeViewController.swift
//  DrawerShowCase
//
//  Created by HDimes on 9/21/19.
//  Copyright © 2019 Anypli. All rights reserved.
//

import UIKit

protocol HomeDelegate: class {
    func showDetails()
}

class HomeViewController: UIViewController {

    weak var delegate: HomeDelegate?
    weak var menuResponder: MenuResponder?

    override func viewDidLoad() {
        let menuButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(openMenu))
        navigationItem.leftBarButtonItem = menuButton
    }

    @IBAction func showDetails() {
        delegate?.showDetails()
    }
    
    @objc
    func openMenu() {
        menuResponder?.showMenu()
    }

}
