//
//  MentionsViewController.swift
//  EPii
//
//  Created by Dimessi on 9/24/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class MentionsViewController: UIViewController {
    
    let bgimage = UIImageView(image: UIImage(named: "Blur bg-1"))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    

    func setupView(){
        
        bgimage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bgimage)
        let bgimageTop = bgimage.topAnchor.constraint(equalTo: view.topAnchor)
        let bgimageLeading = bgimage.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let bgimageTrailing = bgimage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bgimageBottom = bgimage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        let title1 = UILabel()
        title1.font = UIFont.boldSystemFont(ofSize: 16)
        title1.attributedText = NSAttributedString(string: "Objectif de l'application :", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        title1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title1)
        let title1Top = title1.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        let title1Leading = title1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        let title1Trailing = title1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        let title1Height = title1.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([bgimageTop, bgimageTrailing, bgimageLeading, bgimageBottom, title1Top, title1Height, title1Leading, title1Trailing])
    }

}
