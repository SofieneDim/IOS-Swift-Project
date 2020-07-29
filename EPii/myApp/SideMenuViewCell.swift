//
//  SideMenuViewCell.swift
//  EPii
//
//  Created by Dimessi on 10/1/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class SideMenuViewCell: UITableViewCell {

    var iconImage: String?
    var title: String?
    
    var iconImageView: UIImageView = {
        var bgImageView = UIImageView()
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        return bgImageView
    }()
    
    var titleView: UILabel = {
        var titleView = UILabel()
        titleView.font = UIFont.systemFont(ofSize: 17)
        
        titleView.backgroundColor = .clear
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        return titleView
    }()
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        let bottomLineView = UIImageView(image: UIImage(named: "BottomLine"))
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(style: style, reuseIdentifier: reuseIdentifier )
        
        backgroundColor = .clear
        
        self.addSubview(iconImageView)
        let iconHeight = iconImageView.heightAnchor.constraint(equalToConstant: 35)
        let iconWidth = iconImageView.widthAnchor.constraint(equalToConstant: 35)
        let iconCenterY = iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        let iconLeading = iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        
        self.addSubview(titleView)
        let titleViewWidth = titleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
        let titleViewLeading = titleView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 20)
        let titleCentreY = titleView.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        self.addSubview(bottomLineView)
        let lineHeight = bottomLineView.heightAnchor.constraint(equalToConstant: 2)
        let lineLeading = bottomLineView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let lineTrailing = bottomLineView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let lineBottom = bottomLineView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        NSLayoutConstraint.activate([iconHeight, iconLeading, iconWidth, iconCenterY,
                                     lineHeight, lineBottom, lineTrailing, lineLeading,
                                     titleCentreY, titleViewWidth, titleViewLeading])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconImageView.image = UIImage(named: iconImage!)
        titleView.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
