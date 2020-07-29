//
//  AbscencesView.swift
//  EPii
//
//  Created by Dimessi on 10/2/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

struct Expandable {
    var isExpanded: Bool
    var content: [String]
}

class AbscencesView: UIView {

    let bgimage = UIImageView(image: UIImage(named: "Blur bg-1"))
    var abscences = AbscencesData()
    var abscencesPercent: Float = 32.40
    let backView = UIView()
    let session = SessionExpired(message: "Ssession expirée")
    
    let pourcentage = UILabel()
    let taux = UILabel()
    let tableView: UITableView
    
    var content = [Expandable(isExpanded: true, content: ["24/09/2019"]),
                   Expandable(isExpanded: true, content: ["04/08/2019"]),
                   Expandable(isExpanded: true, content: ["16/10/2019"]),
                   Expandable(isExpanded: true, content: ["28/11/2019"])]
    var dropDown = UIImage(named: "DownArrow")
    var dropUp = UIImage(named: "UpArrow")
    
    let dateDébut = UILabel()
    let dateFin = UILabel()
    let datePicker: DatePickerView
    
    let shapLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    
     init(frame: CGRect, delegate: DatePickerDelegate){
        
        self.tableView = UITableView(frame: .zero, style: .plain)
        datePicker = DatePickerView(delegate: delegate)
        
        super.init(frame: frame)
        
        dateDébut.textColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        dateDébut.font = UIFont.boldSystemFont(ofSize: 15)
        dateDébut.numberOfLines = 2
        dateDébut.textAlignment = .center
        
        dateFin.textColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        dateFin.textAlignment = .center
        dateFin.font = UIFont.boldSystemFont(ofSize: 15)
        dateFin.numberOfLines = 2
        
        pourcentage.text = String(abscencesPercent)
        pourcentage.textAlignment = .center
        pourcentage.textColor = #colorLiteral(red: 0.1936047558, green: 0.1955216346, blue: 0.1955216346, alpha: 1)
        
        backView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        taux.text = "Taux total d'absence"
        taux.textColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        taux.textAlignment = .center
        taux.font = UIFont.boldSystemFont(ofSize: 16)
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "Blur bg-1"))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
       setupView()
       circularIndicator()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        
        bgimage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bgimage)
        let bgimageTop = bgimage.topAnchor.constraint(equalTo: topAnchor)
        let bgimageLeading = bgimage.leadingAnchor.constraint(equalTo: leadingAnchor)
        let bgimageTrailing = bgimage.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bgimageBottom = bgimage.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        pourcentage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pourcentage)
        let pourcentageTop = pourcentage.topAnchor.constraint(equalTo: topAnchor, constant: 80)
        let pourcentageCenterX = pourcentage.centerXAnchor.constraint(equalTo: centerXAnchor)
        let pourcentageWidth = pourcentage.widthAnchor.constraint(equalToConstant: 100)
        let pourcentageHeight = pourcentage.heightAnchor.constraint(equalToConstant: 100)
        
        taux.translatesAutoresizingMaskIntoConstraints = false
        addSubview(taux)
        let tauxTop = taux.topAnchor.constraint(equalTo: pourcentage.bottomAnchor, constant: 30)
        let tauxCenterX = taux.centerXAnchor.constraint(equalTo: centerXAnchor)
        let tauxHeight = taux.heightAnchor.constraint(equalToConstant: 20)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        let tableViewTop = tableView.topAnchor.constraint(equalTo: taux.bottomAnchor, constant: 30)
        let tableViewLeading = tableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let tableViewTrailing = tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        let heightConstraint = tableView.heightAnchor.constraint(equalTo: heightAnchor) //*******
        
        NSLayoutConstraint.activate([bgimageTop, bgimageTrailing, bgimageLeading, bgimageBottom,
                                     pourcentageTop, pourcentageWidth, pourcentageHeight, pourcentageCenterX ,
                                     tauxTop, tauxCenterX, tauxHeight, tableViewTop, tableViewLeading, tableViewTrailing, heightConstraint])
    }
    
    func showTopLabel(debut: String, fin: String){
        
        dateDébut.text = "Date de début : \(debut)"
        dateFin.text = "Date de fin: \(fin)"
        
        dateDébut.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateDébut)
        let debutTop = dateDébut.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        let debutLeading = dateDébut.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        let debutWidth = dateDébut.widthAnchor.constraint(equalToConstant: 120)
        let debutHeight = dateDébut.heightAnchor.constraint(equalToConstant: 50)
        
        dateFin.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateFin)
        let finTop = dateFin.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        let finLeading = dateFin.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let finWidth = dateFin.widthAnchor.constraint(equalToConstant: 90)
        let finHeight = dateFin.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([debutTop, debutWidth, debutHeight, debutLeading, finTop, finWidth, finHeight, finLeading])
    }
    
    func showDatePicker(){
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        addSubview(datePicker)
        let dateTop = datePicker.topAnchor.constraint(equalTo: topAnchor)
        let dateLead = datePicker.leadingAnchor.constraint(equalTo: leadingAnchor)
        let dateTrai = datePicker.trailingAnchor.constraint(equalTo: trailingAnchor)
        let dateBottom = datePicker.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        NSLayoutConstraint.activate([dateTop, dateLead, dateTrai, dateBottom])
    }
    
    func sessionExpired(sessionDelegate: SessionExpiredView){
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backView)
        let backTop = backView.topAnchor.constraint(equalTo: topAnchor)
        let backLead = backView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let backTrai = backView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let backBottom = backView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        session.translatesAutoresizingMaskIntoConstraints = false
        addSubview(session)
        let sessioncentreY = session.centerYAnchor.constraint(equalTo: centerYAnchor)
        let sessionHeight = session.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        let sessionTrai = session.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let sessionLead = session.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        
        NSLayoutConstraint.activate([sessioncentreY, sessionHeight, sessionTrai, sessionLead, backTop, backLead, backTrai, backBottom])
        session.delegate = sessionDelegate
    }

    func circularIndicator(){
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: center.x, y: 130), radius: 65, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        layer.addSublayer(trackLayer)
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = #colorLiteral(red: 0.5019036531, green: 0.5019937158, blue: 0.5018979907, alpha: 1)
        trackLayer.lineWidth = 9
        trackLayer.strokeEnd = 1
        trackLayer.fillColor = UIColor.clear.cgColor
        
        layer.addSublayer(shapLayer)
        shapLayer.path = circularPath.cgPath
        shapLayer.strokeColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        shapLayer.lineWidth = 10
        shapLayer.strokeEnd = 0
        shapLayer.lineCap = .round
        shapLayer.fillColor = UIColor.clear.cgColor
    }
    
    @objc func startAnimate(){
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = abscencesPercent / Float(100)
        
        basicAnimation.duration = 3
        basicAnimation.fillMode =  .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapLayer.add(basicAnimation, forKey: "")
    }
}

extension AbscencesView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return content.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if content[section].isExpanded {
            return 0
        }
        return content[section].content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = content[indexPath.section].content[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = AbscencesHeaderView()
        headerView.dropView.addTarget(self, action: #selector(handle), for: .touchUpInside)
        headerView.dropView.tag = section
        
        headerView.title = "Droit du travail et éthiue de l'ingénieur (cours)"
        headerView.percent = "1.47"
        headerView.dropView.setImage(dropDown, for: .normal)
        
        return headerView
    }
    
    @objc func handle(button: UIButton){
        
        let section = button.tag
        let isExpanded = content[section].isExpanded
        
        let indexPath = IndexPath(row: 0, section: section)
        
        content[section].isExpanded = !isExpanded

        if isExpanded {
            tableView.insertRows(at: [indexPath], with: .fade)
            button.setImage(dropUp, for: .normal)
        } else {
            tableView.deleteRows(at: [indexPath], with: .fade)
            button.setImage(dropDown, for: .normal)
        }
    }
}
