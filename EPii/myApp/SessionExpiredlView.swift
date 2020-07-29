//
//  LoginFailView.swift
//  EPii
//
//  Created by Dimessi on 10/5/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

protocol SessionExpiredView {
    func dismissAlert()
}

class SessionExpired: UIView {

    let title = UILabel()
    let message = UILabel()
    let annuler = UIButton()
    var delegate: SessionExpiredView?
    
    init(message: String) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        title.text = "erreur"
        title.textColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        title.font = UIFont.boldSystemFont(ofSize: 15)
        title.textAlignment = .center
        
        self.message.text = message
        self.message.textColor = #colorLiteral(red: 0.6487819864, green: 0.6487819864, blue: 0.6487819864, alpha: 1)
        self.message.font = UIFont.systemFont(ofSize: 13)
        self.message.textAlignment = .center
        
        annuler.setTitle("Ok", for: .normal)
        annuler.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        annuler.backgroundColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        annuler.addTarget(self, action: #selector(annulerP), for: .touchUpInside)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func annulerP(){
        delegate?.dismissAlert()
    }
    
    func setupView(){
        
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        let titleTop = title.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        let titleCenterX = title.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        message.translatesAutoresizingMaskIntoConstraints = false
        addSubview(message)
        let messageTop = message.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20)
        let messageCenterX = message.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        annuler.translatesAutoresizingMaskIntoConstraints = false
        addSubview(annuler)
        let annulerBottom = annuler.bottomAnchor.constraint(equalTo: bottomAnchor)
        let annulerLeading = annuler.leadingAnchor.constraint(equalTo: leadingAnchor)
        let annulerTrailing = annuler.trailingAnchor.constraint(equalTo: trailingAnchor)
        let annulerHeight = annuler.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([titleTop, titleCenterX, messageTop, messageCenterX,
                                     annulerBottom, annulerHeight, annulerLeading, annulerTrailing])
    }
    
}
