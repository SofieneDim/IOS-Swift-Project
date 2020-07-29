//
//  ConnexionView.swift
//  EPii
//
//  Created by Dimessi on 9/29/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

protocol Actions {
    func connexion(adress: String, password: String)
    func inscription()
    func passwordF()
}

class ConnexionView: UIView {
    
    var delegate: Actions?
    let alertView = NetworkAlertView()
    var bgImage: UIImageView
    let logo: UIImageView
    let adressT: UITextField
    let passwordT: UITextField
    let submit: UIButton
    var blackLine: UIView {
        let blackLine = UIView()
        blackLine.backgroundColor = .black
        return blackLine
    }
    let inscription: UIButton
    let passwordF: UIButton
    let _darkView = UIView(frame: .zero)
    let spinnerImage = UIImageView(image: UIImage(named: "Layer 0"))
    let session = SessionExpired(message: "L'adresse email ou le mot de passe est incorrect!")

    init() {
        
        bgImage = UIImageView(image: UIImage(named: "Blur bg-1"))
        
        logo = UIImageView(image: UIImage(named: "LogoEpi"))
        
        adressT = UITextField()
        adressT.font = UIFont.systemFont(ofSize: 13)
        adressT.autocapitalizationType = UITextAutocapitalizationType.none
        adressT.textContentType = UITextContentType.emailAddress
        adressT.attributedPlaceholder = NSAttributedString(string: "Adresse électronique", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)])
        
        passwordT = UITextField()
        passwordT.font = UIFont.systemFont(ofSize: 13)
        passwordT.autocapitalizationType = UITextAutocapitalizationType.none
        passwordT.textContentType = UITextContentType.password
        passwordT.attributedPlaceholder = NSAttributedString(string: "Mot de passe", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)])
        
        submit = UIButton()
        submit.backgroundColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        submit.setTitle("CONNEXION", for: .normal)
        submit.layer.cornerRadius = 5
        submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        inscription = UIButton()
        inscription.setTitleColor(#colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1), for: .normal)
        inscription.setTitle("Inscription", for: .normal)
        inscription.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        
        passwordF = UIButton()
        passwordF.setTitleColor(#colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1), for: .normal)
        passwordF.setTitle("Mot de passe oublié ?", for: .normal)
        passwordF.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        
        _darkView.backgroundColor = .black
        _darkView.alpha = 0.7
        _darkView.isHidden = true
        spinnerImage.isHidden = true
        
        super.init(frame: .zero)
        
        submit.addTarget(self, action: #selector(connexion), for: .touchUpInside)
        inscription.addTarget(self, action: #selector(newInscription), for: .touchUpInside)
        passwordF.addTarget(self, action: #selector(passwordForgetten), for: .touchUpInside)
        
        initializeView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func connexion(){
        delegate?.connexion(adress: adressT.text ?? "", password: passwordT.text ?? "")
    }
    
    @objc func newInscription(){
        delegate?.inscription()
    }
    
    @objc func passwordForgetten(){
        delegate?.passwordF()
    }
    
    func showAuthError(delegate: SessionExpiredView){
        
        session.delegate = delegate
        session.translatesAutoresizingMaskIntoConstraints = false
        addSubview(session)
        let sessioncentreY = session.centerYAnchor.constraint(equalTo: centerYAnchor)
        let sessionHeight = session.heightAnchor.constraint(equalToConstant: 150)
        let sessionTrai = session.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let sessionLead = session.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        
        NSLayoutConstraint.activate([sessioncentreY, sessionHeight, sessionTrai, sessionLead])
    }
    
    func showError(delegate: NetworkFail){
        
        alertView.delegate = delegate
        alertView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(alertView)
        let alerCentreY = alertView.centerYAnchor.constraint(equalTo: centerYAnchor)
        let alertHeight = alertView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        let alertLeading = alertView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let alertTrailing = alertView.trailingAnchor.constraint(equalTo: trailingAnchor)
        NSLayoutConstraint.activate([alertTrailing, alertLeading, alertHeight, alerCentreY])
    }
    
    func initializeView(){
        
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bgImage)
        let bgTop = bgImage.topAnchor.constraint(equalTo: topAnchor)
        let bgTrailing = bgImage.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bgLeading = bgImage.leadingAnchor.constraint(equalTo: leadingAnchor)
        let bgHeight = bgImage.heightAnchor.constraint(equalTo: heightAnchor)

        logo.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logo)
        let logoTop = logo.topAnchor.constraint(equalTo: topAnchor, constant: 100)
        let logoTrailing = logo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)
        let logoLeading = logo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100)
        let logoHeight = logo.heightAnchor.constraint(equalToConstant: 120)

        adressT.translatesAutoresizingMaskIntoConstraints = false
        addSubview(adressT)
        let adressTop = adressT.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 50)
        let adressLeading = adressT.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        let adressTrainling = adressT.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        let adressHeight = adressT.heightAnchor.constraint(equalToConstant: 30)

        let bottomLine = blackLine
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomLine)
        let lineTop = bottomLine.topAnchor.constraint(equalTo: adressT.bottomAnchor)
        let lineTrailing = bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        let lineLeading = bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        let lineHeight = bottomLine.heightAnchor.constraint(equalToConstant: 0.5)

        passwordT.translatesAutoresizingMaskIntoConstraints = false
        addSubview(passwordT)
        let passwordTop = passwordT.topAnchor.constraint(equalTo: bottomLine.bottomAnchor, constant: 20)
        let passwordLeading = passwordT.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        let passwordTrainling = passwordT.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        let passwordHeight = passwordT.heightAnchor.constraint(equalToConstant: 30)
        
        
        
        let bottomLine2 = blackLine
        bottomLine2.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomLine2)
        let lineTop2 = bottomLine2.topAnchor.constraint(equalTo: passwordT.bottomAnchor)
        let lineTrailing2 = bottomLine2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        let lineLeading2 = bottomLine2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        let lineHeight2 = bottomLine2.heightAnchor.constraint(equalToConstant: 0.5)

        submit.translatesAutoresizingMaskIntoConstraints = false
        addSubview(submit)
        let submitTop = submit.topAnchor.constraint(equalTo: bottomLine2.bottomAnchor, constant: 50)
        let submitTrailing = submit.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        let submitLeading = submit.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        let submitHeight = submit.heightAnchor.constraint(equalToConstant: 50)
        
        inscription.translatesAutoresizingMaskIntoConstraints = false
        addSubview(inscription)
        let inscriTop = inscription.topAnchor.constraint(equalTo: submit.bottomAnchor, constant: 30)
        let inscriTrailing = inscription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        let inscriLeading = inscription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        let inscriHeight = inscription.heightAnchor.constraint(equalToConstant: 45)

        passwordF.translatesAutoresizingMaskIntoConstraints = false
        addSubview(passwordF)
        let passFTop = passwordF.topAnchor.constraint(equalTo: inscription.bottomAnchor, constant: 10)
        let passFTrailing = passwordF.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        let passFLeading = passwordF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        let passFHeight = passwordF.heightAnchor.constraint(equalToConstant: 45)

        _darkView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_darkView)
        let darkLeading = _darkView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let darkTrailing = _darkView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let darkTop = _darkView.topAnchor.constraint(equalTo: topAnchor)
        let darkBottom = _darkView.bottomAnchor.constraint(equalTo: bottomAnchor)

        spinnerImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(spinnerImage)
        let spinnerCentreY = spinnerImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        let spinnerCentreX = spinnerImage.centerXAnchor.constraint(equalTo: centerXAnchor)
        let spinnerHeight = spinnerImage.heightAnchor.constraint(equalToConstant: 70)
        let spinnerWidth = spinnerImage.widthAnchor.constraint(equalToConstant: 70)
        
        NSLayoutConstraint.activate([bgTop, bgTrailing, bgLeading, bgHeight,
                                     logoTop, logoTrailing, logoLeading, logoHeight,
                                     adressTop, adressHeight, adressLeading, adressTrainling, passwordTop, passwordHeight, passwordLeading, passwordTrainling,
                                     lineHeight, lineTop, lineLeading, lineTrailing, lineHeight2, lineTop2, lineLeading2, lineTrailing2,
                                     submitTop, submitHeight, submitLeading, submitTrailing, inscriTop, inscriHeight, inscriLeading, inscriTrailing,
                                     passFTop, passFHeight, passFLeading, passFTrailing, darkLeading, darkTrailing, darkTop, darkBottom,
                                     spinnerCentreX, spinnerCentreY, spinnerWidth, spinnerHeight])
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Double.pi * 2
        rotationAnimation.duration = 0.7
        rotationAnimation.repeatCount = .infinity
        spinnerImage.layer.add(rotationAnimation, forKey: nil)
    }
}
