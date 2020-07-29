//
//  NotesViewCell.swift
//  EPii
//
//  Created by Dimessi on 10/1/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class NotesViewCell: UITableViewCell {

    var title: String?
    var content: String?
    
    var titleView: UILabel = {
        var titleView = UILabel()
        titleView.font = UIFont.boldSystemFont(ofSize: 17)
        titleView.backgroundColor = .clear
        titleView.translatesAutoresizingMaskIntoConstraints = false
        return titleView
    }()
    
    var descriptionV: UILabel = {
        var descriptionV = UILabel()
        descriptionV.font = UIFont.systemFont(ofSize: 15)
        descriptionV.backgroundColor = .clear
        descriptionV.translatesAutoresizingMaskIntoConstraints = false
        return descriptionV
    }()
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier )
        
        backgroundColor = .clear
        
        let accessoryView = UIImageView(image: UIImage(named: "Objet dynamique vectoriel"))
        accessoryView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(accessoryView)
        let accessoryCenterY = accessoryView.centerYAnchor.constraint(equalTo: centerYAnchor)
        let accessoryTrailing = accessoryView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        let accessoryHeight = accessoryView.heightAnchor.constraint(equalToConstant: 20)
        let accessoryWidth = accessoryView.widthAnchor.constraint(equalToConstant: 15)
        
        self.addSubview(titleView)
        let titleTop = titleView.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        let titleLeading = titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        let titleTrailing = titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        let titleHeight = titleView.heightAnchor.constraint(equalToConstant: 30)
        
        self.addSubview(descriptionV)
        let descriptionBottom = descriptionV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        let descriptionLeading = descriptionV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        let descriptionTrailing = descriptionV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        let descriptionHeight = descriptionV.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([titleTop, titleTrailing, titleLeading, titleHeight,
                                     descriptionBottom, descriptionTrailing, descriptionLeading, descriptionHeight,
                                     accessoryCenterY, accessoryTrailing, accessoryHeight, accessoryWidth])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleView.text = title
        descriptionV.text = content
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
