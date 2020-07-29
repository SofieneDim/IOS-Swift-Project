//
//  ActualityViewCell.swift
//  EPii
//
//  Created by Dimessi on 9/29/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class ActualityViewCell: UITableViewCell {

    var bgImage: UIImage?
    var title: String?
    var content: String?
    var date: String?
    
    var bgImageView: UIImageView = {
        var bgImageView = UIImageView()
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        return bgImageView
    }()
    
    var titleView: UILabel = {
        var titleView = UILabel()
        titleView.textColor = .white
        titleView.font = UIFont.boldSystemFont(ofSize: 17)
        titleView.backgroundColor = .clear
        titleView.translatesAutoresizingMaskIntoConstraints = false
        return titleView
    }()
    
    var contentTextView: UILabel = {
        var contentView = UILabel()
        contentView.textColor = .white
        contentView.font = UIFont.boldSystemFont(ofSize: 14)
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    var datetView: UILabel = {
        var datetView = UILabel()
        datetView.textAlignment = .right
        datetView.font = UIFont.boldSystemFont(ofSize: 14)
        datetView.backgroundColor = .clear
        datetView.textColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        datetView.translatesAutoresizingMaskIntoConstraints = false
        return datetView
    }()
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        let textBG = UILabel()
        textBG.translatesAutoresizingMaskIntoConstraints = false
        textBG.backgroundColor = #colorLiteral(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5170162671)
        
        let bottomLineView = UIImageView(image: UIImage(named: "BottomLine"))
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(style: style, reuseIdentifier: reuseIdentifier )
        
        self.addSubview(bgImageView)
        self.addSubview(datetView)
        self.addSubview(bottomLineView)
        self.addSubview(textBG)
        self.addSubview(titleView)
        self.addSubview(contentTextView)
        
        let bgTop = bgImageView.topAnchor.constraint(equalTo: topAnchor)
        let bgLeading = bgImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let bgTrailing = bgImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bgBottom = bgImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        let lineHeight = bottomLineView.heightAnchor.constraint(equalToConstant: 2)
        let lineLeading = bottomLineView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let lineTrailing = bottomLineView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let lineBottom = bottomLineView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        let dateTop = datetView.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        let dateHeight = datetView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15)
        let dateTrailing = datetView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let dateLeading = datetView.leadingAnchor.constraint(equalTo: leadingAnchor)
        
        let textBGHeight = textBG.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
        let textBGTrailing = textBG.trailingAnchor.constraint(equalTo: trailingAnchor)
        let textBGLeading = textBG.leadingAnchor.constraint(equalTo: leadingAnchor)
        let textBGBottom = textBG.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
        
        let titleViewHeight = titleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15)
        let titleViewTrailing = titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let titleViewLeading = titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        let titleViewBottom = titleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        
        let contentHeight = contentTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        let contentTrailing = contentTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let contentLeading = contentTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        let contentBottom = contentTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        
        NSLayoutConstraint.activate([bgTop, bgLeading, bgTrailing, bgBottom,
                                     lineHeight, lineBottom, lineTrailing, lineLeading,
                                     dateTop, dateTrailing, dateLeading, dateHeight,
                                     textBGBottom, textBGHeight, textBGLeading, textBGTrailing,
                                     titleViewBottom, titleViewHeight, titleViewLeading, titleViewTrailing,
                                     contentBottom, contentHeight, contentLeading, contentTrailing])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let gbimage = bgImage {
            bgImageView.image = gbimage
        } else {
            bgImageView.image = UIImage(named: "placeholder")
        }
        
        titleView.text = title
        contentTextView.text = content
        datetView.text = date
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
