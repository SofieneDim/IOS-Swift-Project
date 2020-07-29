//
//  HomeNavigationController.swift
//  EPii
//
//  Created by Dimessi on 9/29/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class HomeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topLine = UIImageView()
        topLine.image = UIImage(named: "BottomLine")
        topLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topLine)
        
        let lineTop = topLine.topAnchor.constraint(equalTo: navigationBar.bottomAnchor)
        let lineLeading = topLine.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let lineTrailing = topLine.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let lineHeight = topLine.heightAnchor.constraint(equalToConstant: 2)
        
        NSLayoutConstraint.activate([lineTop, lineHeight, lineLeading, lineTrailing])
        
        navigationBar.tintColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        navigationBar.barStyle = .default
        navigationBar.setBackgroundImage(UIImage(named: "Blur bg-1"), for: .default)
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)]
    }
}
