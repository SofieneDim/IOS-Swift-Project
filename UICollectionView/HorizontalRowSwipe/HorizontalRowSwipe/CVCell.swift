//
//  CVCell.swift
//  HorizontalRowSwipe
//
//  Created by Dimessi on 10/14/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class CVCell: UICollectionViewCell {
    
    var data: customData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image
        }
    }
    
    let bg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        bg.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bg)
        let bgTop = bg.topAnchor.constraint(equalTo: topAnchor)
        let bgLeading = bg.leadingAnchor.constraint(equalTo: leadingAnchor)
        let bgTrailing = bg.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bgBottom = bg.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        NSLayoutConstraint.activate([bgTop, bgBottom, bgLeading, bgTrailing])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
