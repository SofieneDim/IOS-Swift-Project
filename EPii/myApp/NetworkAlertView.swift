//
//  AlertView.swift
//  EPii
//
//  Created by Dimessi on 10/5/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

protocol NetworkFail {
    func annulerP()
    func réessayerP()
}

class NetworkAlertView: UIView {

    let title = UILabel()
    let message = UILabel()
    let annuler = UIButton()
    let réessayer = UIButton()
    let topLine = UIView()
    var delegate: NetworkFail?
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        title.text = "erreur"
        title.textColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        title.font = UIFont.boldSystemFont(ofSize: 15)
        title.textAlignment = .center
        
        message.text = "Merci de vérifier votre connexion"
        message.textColor = #colorLiteral(red: 0.6487819864, green: 0.6487819864, blue: 0.6487819864, alpha: 1)
        message.font = UIFont.systemFont(ofSize: 13)
        message.textAlignment = .center
        
        topLine.backgroundColor = #colorLiteral(red: 0.6487819864, green: 0.6487819864, blue: 0.6487819864, alpha: 1)
        
        annuler.setTitle("Annuler", for: .normal)
        annuler.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        annuler.setTitleColor(#colorLiteral(red: 0.6487819864, green: 0.6487819864, blue: 0.6487819864, alpha: 1), for: .normal)
        annuler.addTarget(self, action: #selector(annulerP), for: .touchUpInside)
        
        réessayer.setTitle("Réessayer", for: .normal)
        réessayer.backgroundColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        réessayer.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        réessayer.addTarget(self, action: #selector(réessayerP), for: .touchUpInside)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func annulerP(){
        delegate?.annulerP()
    }
    
    @objc func réessayerP(){
        delegate?.réessayerP()
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
        let annulerTrailing = annuler.trailingAnchor.constraint(equalTo: centerXAnchor)
        let annulerHeight = annuler.heightAnchor.constraint(equalToConstant: 40)
        
        topLine.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topLine)
        let topLineTop = topLine.topAnchor.constraint(equalTo: annuler.topAnchor)
        let topLineHeight = topLine.heightAnchor.constraint(equalToConstant: 1)
        let topLineLeading = topLine.leadingAnchor.constraint(equalTo: annuler.leadingAnchor)
        let topLineTrailing = topLine.trailingAnchor.constraint(equalTo: annuler.trailingAnchor)
        
        réessayer.translatesAutoresizingMaskIntoConstraints = false
        addSubview(réessayer)
        let réessayerBottom = réessayer.bottomAnchor.constraint(equalTo: bottomAnchor)
        let réessayerLeading = réessayer.leadingAnchor.constraint(equalTo: annuler.trailingAnchor)
        let réessayerTrailing = réessayer.trailingAnchor.constraint(equalTo: trailingAnchor)
        let réessayerHeight = réessayer.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([titleTop, titleCenterX, messageTop, messageCenterX,
                                     annulerBottom, annulerHeight, annulerLeading, annulerTrailing,
                                     topLineTop, topLineHeight, topLineLeading, topLineTrailing,
                                     réessayerBottom, réessayerHeight, réessayerLeading, réessayerTrailing])
    }
}
