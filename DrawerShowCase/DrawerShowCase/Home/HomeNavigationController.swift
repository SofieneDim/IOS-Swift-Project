//
//  HomeNavigationController.swift
//  DrawerShowCase
//
//  Created by HDimes on 9/21/19.
//  Copyright © 2019 Anypli. All rights reserved.
//

import UIKit

class HomeNavigationController: UINavigationController, HomeDelegate, DetailsDelegate {

    func showDetails() {
        let detailVC = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        detailVC.delegate = self
        pushViewController(detailVC, animated: true)
    }
    
    func showHome() {
        popViewController(animated: true)
    }

}
