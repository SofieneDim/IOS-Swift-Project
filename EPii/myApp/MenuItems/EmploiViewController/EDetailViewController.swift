//
//  EDetailViewController.swift
//  EPii
//
//  Created by Dimessi on 9/27/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class EDetailViewController: UIViewController {

    var seance: Seancess?
    var day: [String : String] = [:]
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emploiDetailV = EmploiDetailView(seance: seance!, day: day, index: index)
        
        view = emploiDetailV
    }
    
}
