//
//  MenuView.swift
//  DrawerShowCase
//
//  Created by HDimes on 9/21/19.
//  Copyright © 2019 Anypli. All rights reserved.
//

import UIKit

enum MenuEnum: Int {
    case home
    case profile
    case contact
    case logout
}

protocol MenuDelegate: class {
    func selectedMenu(menu: MenuEnum)
}

class MenuView: UIView {
    
    static let MenuWidth = UIScreen.main.bounds.width * 2 / 3

    let delegate: MenuDelegate
    let menus: [String] = ["Home", "Profile", "Contact", "LogOut"]
    
    let tableView: UITableView
    
    init(delegate: MenuDelegate) {
        self.delegate = delegate
        self.tableView = UITableView(frame: .zero, style: .plain)
        
        super.init(frame: .zero)
        
        layoutView()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        let centerYConstraint = tableView.centerYAnchor.constraint(equalTo: centerYAnchor)
        let leadingConstraint = tableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailingConstraint = tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let heightConstraint = tableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        NSLayoutConstraint.activate([centerYConstraint, leadingConstraint, trailingConstraint, heightConstraint])
    }
    
}

extension MenuView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .gray
        cell.textLabel?.text = menus[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / CGFloat(menus.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedState = MenuEnum(rawValue: indexPath.row) {
            delegate.selectedMenu(menu: selectedState)
        }
    }
    
}
