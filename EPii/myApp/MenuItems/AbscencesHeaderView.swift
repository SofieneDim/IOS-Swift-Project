//
//  AbscencesHeaderView.swift
//  EPii
//
//  Created by Dimessi on 10/12/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class AbscencesHeaderView: UIView {
    
    var title: String?
    var percent: String?
    let bottomLine = UIView()
    
    var titleView: UILabel = {
        var titleView = UILabel()
        titleView.font = UIFont.systemFont(ofSize: 15)
        titleView.numberOfLines = 2
        titleView.backgroundColor = .clear
        titleView.translatesAutoresizingMaskIntoConstraints = false
        return titleView
    }()
    
    var dropView: UIButton = {
        var dropView = UIButton()
        dropView.backgroundColor = .clear
        dropView.translatesAutoresizingMaskIntoConstraints = false
        return dropView
    }()
    
    var percentage: UILabel = {
        var percentage = UILabel()
        percentage.font = UIFont.systemFont(ofSize: 15)
        percentage.textColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        percentage.textAlignment = .center
        percentage.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        percentage.layer.borderColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        percentage.layer.cornerRadius = 15
        percentage.layer.borderWidth = 3
        percentage.translatesAutoresizingMaskIntoConstraints = false
        return percentage
    }()

    init(){
        super.init(frame: .zero)
        
        self.addSubview(titleView)
        let titleCenterY = titleView.centerYAnchor.constraint(equalTo: centerYAnchor)
        let titleLeading = titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        let titleTrailing = titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150)
        
        self.addSubview(dropView)
        let accessoryCenterY = dropView.centerYAnchor.constraint(equalTo: centerYAnchor)
        let accessoryWidht = dropView.widthAnchor.constraint(equalToConstant: 20)
        let accessoryLeading = dropView.leadingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: 20)
        let accessoryHeight = dropView.heightAnchor.constraint(equalToConstant: 15)

        self.addSubview(percentage)
        let percentageCenterY = percentage.centerYAnchor.constraint(equalTo: centerYAnchor)
        let percentageTrailing = percentage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        let percentageWidht = percentage.widthAnchor.constraint(equalToConstant: 60)
        let percentageHeight = percentage.heightAnchor.constraint(equalToConstant: 40)
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomLine)
        let lineBottom = bottomLine.bottomAnchor.constraint(equalTo: bottomAnchor)
        let lineTrailing = bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor)
        let lineLeading = bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor)
        let lineHeight = bottomLine.heightAnchor.constraint(equalToConstant: 1)

        
        NSLayoutConstraint.activate([titleCenterY, titleTrailing, titleLeading,
                                     accessoryCenterY, accessoryWidht, accessoryHeight, accessoryLeading,
                                     percentageCenterY, percentageTrailing, percentageWidht, percentageHeight,
                                     lineHeight, lineBottom, lineLeading, lineTrailing])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        titleView.text = title
        percentage.text = "%" + percent!
        bottomLine.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
