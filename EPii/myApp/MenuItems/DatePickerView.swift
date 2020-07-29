//
//  DatePickerView.swift
//  EPii
//
//  Created by Dimessi on 10/6/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func valider(debutDate: String, finDate: String)
    func annuler()
}

class DatePickerView: UIView {

    let debut = UIButton()
    let fin = UIButton()
    let datePicker: UIDatePicker = UIDatePicker()
    let annuler = UIButton()
    let valider = UIButton()
    var debutState = true
    let dateFormatter: DateFormatter = DateFormatter()
    var debutDateS: String = ""
    var finDateS: String = ""
    var debutDateD = Date()
    var finDateD = Date()
    var delegate: DatePickerDelegate?
    
    var redLine: UIView{
        let redLine = UIView()
        redLine.backgroundColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        return redLine
    }
    let debutBottomLine = UIView()
    let finBottomLine = UIView()
    
    init(delegate: DatePickerDelegate){
        
        self.delegate = delegate
        
        super.init(frame: .zero)
        
        dateFormatter.dateFormat = "MM-dd-yyyy"
        debutDateS = dateFormatter.string(from: Date())
        finDateS = dateFormatter.string(from: Date())
        
        debutBottomLine.backgroundColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        finBottomLine.backgroundColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        datePicker.timeZone = NSTimeZone.local
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = UIColor.white
        datePicker.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
        
        debut.setTitle("DEBUT", for: .normal)
        debut.setTitleColor(.black, for: .normal)
        debut.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        debut.backgroundColor = .white
        debut.addTarget(self, action: #selector(debutButton), for: .touchUpInside)
        
        fin.setTitle("FIN", for: .normal)
        fin.setTitleColor(.black, for: .normal)
        fin.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        fin.backgroundColor = .white
        fin.addTarget(self, action: #selector(finButton), for: .touchUpInside)
        
        annuler.setTitle("Annuler", for: .normal)
        annuler.setTitleColor(.black, for: .normal)
        annuler.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        annuler.backgroundColor = .white
        annuler.addTarget(self, action: #selector(annulerButton), for: .touchUpInside)
        
        valider.setTitle("Valider", for: .normal)
        valider.setTitleColor(.black, for: .normal)
        valider.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        valider.backgroundColor = .white
        valider.addTarget(self, action: #selector(validerButton), for: .touchUpInside)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func valueChanged(_ sender: UIDatePicker){
        
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        
        if debutState {
            debutDateS = selectedDate
            debutDateD = sender.date
        } else {
            finDateS = selectedDate
            finDateD = sender.date
        }
    }
    
    @objc func debutButton(){
        debutBottomLine.isHidden = false
        finBottomLine.isHidden = true
        debutState = true
        datePicker.setDate(debutDateD, animated: true)
        
    }
    
    @objc func finButton(){
        debutBottomLine.isHidden = true
        finBottomLine.isHidden = false
        debutState = false
        datePicker.setDate(finDateD, animated: true)
        
    }
    
    @objc func annulerButton(){
        delegate?.annuler()
    }
    
    @objc func validerButton(){
        delegate?.valider(debutDate: debutDateS, finDate: finDateS)
    }
    
    func setupView(){
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        addSubview(datePicker)
        let dateCenterY = datePicker.centerYAnchor.constraint(equalTo: centerYAnchor)
        let dateTrailing = datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let dateLeading = datePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        let dateHeight = datePicker.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
        
        let topLine = redLine
        topLine.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topLine)
        let topLineBottom = topLine.bottomAnchor.constraint(equalTo: datePicker.topAnchor)
        let topLineTrai = topLine.trailingAnchor.constraint(equalTo: datePicker.trailingAnchor)
        let topLineLead = topLine.leadingAnchor.constraint(equalTo: datePicker.leadingAnchor)
        let topLineHeight = topLine.heightAnchor.constraint(equalToConstant: 2)
        
        debut.translatesAutoresizingMaskIntoConstraints = false
        addSubview(debut)
        let debutBottom = debut.bottomAnchor.constraint(equalTo: topLine.topAnchor)
        let debutTrailing = debut.trailingAnchor.constraint(equalTo: centerXAnchor)
        let debutLeading = debut.leadingAnchor.constraint(equalTo: topLine.leadingAnchor)
        let debutHeight = debut.heightAnchor.constraint(equalToConstant: 40)
        
        debutBottomLine.translatesAutoresizingMaskIntoConstraints = false
        addSubview(debutBottomLine)
        let debutBLBottom = debutBottomLine.bottomAnchor.constraint(equalTo: debut.bottomAnchor)
        let debutBLTrai = debutBottomLine.trailingAnchor.constraint(equalTo: debut.trailingAnchor)
        let debutBLLead = debutBottomLine.leadingAnchor.constraint(equalTo: debut.leadingAnchor)
        let debutBLHeight = debutBottomLine.heightAnchor.constraint(equalToConstant: 4)
        
        fin.translatesAutoresizingMaskIntoConstraints = false
        addSubview(fin)
        let finBottom = fin.bottomAnchor.constraint(equalTo: topLine.topAnchor)
        let finTrailing = fin.trailingAnchor.constraint(equalTo: topLine.trailingAnchor)
        let finLeading = fin.leadingAnchor.constraint(equalTo: debut.trailingAnchor)
        let finHeight = fin.heightAnchor.constraint(equalToConstant: 40)
        
        finBottomLine.translatesAutoresizingMaskIntoConstraints = false
        addSubview(finBottomLine)
        let finBLBottom = finBottomLine.bottomAnchor.constraint(equalTo: fin.bottomAnchor)
        let finBLTrai = finBottomLine.trailingAnchor.constraint(equalTo: fin.trailingAnchor)
        let finBLLead = finBottomLine.leadingAnchor.constraint(equalTo: fin.leadingAnchor)
        let finBLHeight = finBottomLine.heightAnchor.constraint(equalToConstant: 4)
        finBottomLine.isHidden = true
        
        let bottomLine = redLine
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomLine)
        let bottomLTop = bottomLine.topAnchor.constraint(equalTo: datePicker.bottomAnchor)
        let bottomLTrailing = bottomLine.trailingAnchor.constraint(equalTo: datePicker.trailingAnchor)
        let bottomLLeading = bottomLine.leadingAnchor.constraint(equalTo: datePicker.leadingAnchor)
        let bottomLHeight = bottomLine.heightAnchor.constraint(equalToConstant: 1)
        
        let middleLine = redLine
        middleLine.translatesAutoresizingMaskIntoConstraints = false
        addSubview(middleLine)
        let middleLTop = middleLine.topAnchor.constraint(equalTo: datePicker.bottomAnchor)
        let middleLCenterX = middleLine.centerXAnchor.constraint(equalTo: centerXAnchor)
        let middleLWidth = middleLine.widthAnchor.constraint(equalToConstant: 1)
        let middleLHeight = middleLine.heightAnchor.constraint(equalToConstant: 35)
        
        annuler.translatesAutoresizingMaskIntoConstraints = false
        addSubview(annuler)
        let annulerTop = annuler.topAnchor.constraint(equalTo: bottomLine.bottomAnchor)
        let annulerTrailing = annuler.trailingAnchor.constraint(equalTo: middleLine.leadingAnchor)
        let annulerLeading = annuler.leadingAnchor.constraint(equalTo: topLine.leadingAnchor)
        let annulerHeight = annuler.heightAnchor.constraint(equalToConstant: 35)
        
        valider.translatesAutoresizingMaskIntoConstraints = false
        addSubview(valider)
        let validerTop = valider.topAnchor.constraint(equalTo: bottomLine.bottomAnchor)
        let validerTrailing = valider.trailingAnchor.constraint(equalTo: datePicker.trailingAnchor)
        let validerLeading = valider.leadingAnchor.constraint(equalTo: middleLine.trailingAnchor)
        let validerHeight = valider.heightAnchor.constraint(equalToConstant: 35)
        
        NSLayoutConstraint.activate([dateHeight, dateCenterY, dateLeading, dateTrailing,
                                     topLineLead, topLineTrai, topLineBottom, topLineHeight,
                                     debutBottom, debutHeight, debutLeading, debutTrailing,
                                     finBottom, finHeight, finLeading, finTrailing,
                                     bottomLTop, bottomLTrailing, bottomLHeight, bottomLLeading,
                                     middleLTop, middleLWidth, middleLHeight, middleLCenterX,
                                     annulerTop, annulerHeight, annulerLeading, annulerTrailing,
                                     debutBLHeight, debutBLLead, debutBLTrai, debutBLBottom,
                                     validerTop, validerHeight, validerLeading, validerTrailing,
                                     finBLLead, finBLTrai, finBLBottom, finBLHeight])
    }
}
