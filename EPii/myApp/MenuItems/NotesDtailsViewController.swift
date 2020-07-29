//
//  NotesDtailsViewController.swift
//  EPii
//
//  Created by Dimessi on 9/25/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class NotesDtailsViewController: UIViewController {
    
    var dateT: String? = ""
    var titleT: String? = ""
    var contentT: String? = ""
    let bgImage = UIImageView(image: UIImage(named: "Blur bg-1"))
    let dateL = UILabel()
    let titleL = UILabel()
    let contentL = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateL.text = dateT
        dateL.font = UIFont.systemFont(ofSize: 14)
        dateL.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        titleL.text = titleT
        titleL.font = UIFont.boldSystemFont(ofSize: 20)
        titleL.numberOfLines = 0
        contentL.text = contentT
        contentL.numberOfLines = 0
        setupView()
    }
    
    func setupView(){
        
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bgImage)
        let bgTop = bgImage.topAnchor.constraint(equalTo: view.topAnchor)
        let bgLeading = bgImage.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let bgTrailing = bgImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bgBottom = bgImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        dateL.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateL)
        let dateTop = dateL.topAnchor.constraint(equalTo: view.topAnchor, constant: 10)
        let dateWidth = dateL.widthAnchor.constraint(equalToConstant: 100)
        let dateTrailing = dateL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        let dateHeight = dateL.heightAnchor.constraint(equalToConstant: 20)
        
        titleL.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleL)
        let titleTop = titleL.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        let titleLeading = titleL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let titleTrailing = titleL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        
        contentL.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentL)
        let contentTop = contentL.topAnchor.constraint(equalTo: titleL.bottomAnchor, constant: 30)
        let contentLeading = contentL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let contentTrailing = contentL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        
        NSLayoutConstraint.activate([bgTop, bgBottom, bgLeading, bgTrailing,
                                     dateTop, dateHeight, dateWidth, dateTrailing,
                                     titleTop, titleLeading, titleTrailing,
                                     contentTop, contentLeading, contentTrailing])
    }

}
