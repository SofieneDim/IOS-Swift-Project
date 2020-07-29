//
//  DetailsViewController.swift
//  DrawerShowCase
//
//  Created by HDimes on 9/21/19.
//  Copyright © 2019 Anypli. All rights reserved.
//

import UIKit

protocol DetailsDelegate: class {
    func showHome()
}

class DetailsViewController: UIViewController {

    weak var delegate: DetailsDelegate?
    
    @IBAction func goHome() {
        delegate?.showHome()
    }

}
