//
//  SideMenuViewController.swift
//  EPii
//
//  Created by Dimessi on 9/20/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

enum MenuEnum: Int {
    case Actualités
    case Notes
    case Emploi
    case Abscences
    case Mentions
    case Apropos
    case Deconnecter
}

protocol ItemSelectedFromActuality: class {
    func itemSelected(menu: MenuEnum)
}

let Note = "Note d'info"
let Emploi = "Emploi de temps"

class SideMenuViewController: UIView {
    
    var delegate: ItemSelectedFromActuality?
    
    let menusTitles: [String] = ["Actualités", "Notes d'infos", "Emploi de temps", "Absences", "Mentions légales", "À propos", "Se déconnecter"]
    let menusIcons: [String] = ["News", "Note icon", "Emploi icon", "Absence Icon", "Mentions icon", "About icon", "DisconnectIcon"]
    
    let tableView: UITableView
    let bgImage = UIImageView(image: UIImage(named: "Blur bg-1"))
    let logo = UIImageView(image: UIImage(named: "LogoEpi"))
    let fbIcon = UIImageView(image: UIImage(named: "Facebook Icon"))
    let settingIcon = UIImageView(image: UIImage(named: "Setting"))
    
    init(){
        
        //self.delegate = delegate
        self.tableView = UITableView(frame: .zero, style: .plain)
        
        super.init(frame: .zero)
        
        self.tableView.backgroundColor = .clear
        self.tableView.isScrollEnabled = false
        self.tableView.register(SideMenuViewCell.self, forCellReuseIdentifier: "menuCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        layoutView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutView(){
        
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bgImage)
        let bgImageTop = bgImage.topAnchor.constraint(equalTo: topAnchor)
        let bgImageLeading = bgImage.leadingAnchor.constraint(equalTo: leadingAnchor)
        let bgImageTrailing = bgImage.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bgImageBottom = bgImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        settingIcon.translatesAutoresizingMaskIntoConstraints = false
        addSubview(settingIcon)
        let settingTop = settingIcon.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        let settingLeading = settingIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        let settingHeight = settingIcon.heightAnchor.constraint(equalToConstant: 30)
        let settingWidth = settingIcon.widthAnchor.constraint(equalToConstant: 30)
        
        fbIcon.translatesAutoresizingMaskIntoConstraints = false
        addSubview(fbIcon)
        let fbIconTop = fbIcon.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        let fbIconTrailing = fbIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        let fbIconHeight = fbIcon.heightAnchor.constraint(equalToConstant: 30)
        let fbIconWidth = fbIcon.widthAnchor.constraint(equalToConstant: 30)
        
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logo)
        
        let logoTop = logo.topAnchor.constraint(equalTo: fbIcon.bottomAnchor, constant: 40)
        let logoCentreX = logo.centerXAnchor.constraint(lessThanOrEqualTo: centerXAnchor)
        let logoHeight = logo.heightAnchor.constraint(equalToConstant: 100)
        let logoWidth = logo.widthAnchor.constraint(equalToConstant: 150)
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        let tableTop = tableView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 30)
        let tableLeading = tableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let tableTrailing = tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let tableBottom = tableView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor)
        
        NSLayoutConstraint.activate([bgImageTop,bgImageBottom, bgImageLeading, bgImageTrailing,
                                     settingTop, settingWidth, settingHeight, settingLeading,
                                     fbIconTop, fbIconWidth, fbIconHeight, fbIconTrailing,
                                     logoTop, logoHeight, logoCentreX, logoWidth,
                                     tableTop, tableBottom, tableLeading, tableTrailing])
    }
    
}

extension SideMenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menusTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! SideMenuViewCell
        
        cell.title = menusTitles[indexPath.row]
        cell.iconImage = menusIcons[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedState = MenuEnum(rawValue: indexPath.row) {
            //delegate.itemSelected(menu: selectedState)
            
            let name = Notification.Name(Note)
            NotificationCenter.default.post(name: name, object: selectedState)
        }
    }
    
}
