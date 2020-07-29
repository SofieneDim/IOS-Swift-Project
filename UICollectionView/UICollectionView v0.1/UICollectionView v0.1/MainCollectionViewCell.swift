//
//  MainCollectionViewCell.swift
//  UICollectionView v0.1
//
//  Created by Dimessi on 10/14/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    var bg: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bg.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bg)
        let bgTop = bg.topAnchor.constraint(equalTo: contentView.topAnchor)
        let bgLeading = bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let bgTrailing = bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let bgBottom = bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        NSLayoutConstraint.activate([bgTop, bgBottom, bgLeading, bgTrailing])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
