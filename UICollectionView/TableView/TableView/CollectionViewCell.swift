//
//  CollectionViewCell.swift
//  TableView
//
//  Created by Dimessi on 10/16/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private var imageView = UIImageView(image: #imageLiteral(resourceName: "placeholder-image"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView(image: nil, titleT: "", descriptionT: "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(image: UIImage?, titleT: String, descriptionT: String){
        
        let bottomBar = UIView()
        bottomBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4661012414)
        
        let titleLable: UILabel = {
            let title = UILabel()
            title.text = titleT
            title.numberOfLines = 1
            title.font = UIFont.boldSystemFont(ofSize: 17)
            return title
        }()
        
        let descripLable: UILabel = {
            let description = UILabel()
            description.text = descriptionT
            description.numberOfLines = 2
            description.font = UIFont.systemFont(ofSize: 17)
           return description
        }()
        
        if let image = image {
            imageView.image = image
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        let imgTop = imageView.topAnchor.constraint(equalTo: contentView.topAnchor)
        let imgLead = imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let imgTrai = imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let imgBottom = imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bottomBar)
        let bottomBarHeight = bottomBar.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3)
        let bottomBarLead = bottomBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let bottomBarTrai = bottomBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let bottomBarBottom = bottomBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLable)
        let titleTop = titleLable.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 15)
        let titleLead = titleLable.leadingAnchor.constraint(equalTo: bottomBar.leadingAnchor, constant: 10)
        let titleTrai = titleLable.trailingAnchor.constraint(equalTo: bottomBar.trailingAnchor, constant: -10)
        
        let stackView = UIStackView(arrangedSubviews: [descripLable])
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        let stackTop = stackView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 0)
        let stackLead = stackView.leadingAnchor.constraint(equalTo: titleLable.leadingAnchor)
        let stackTrai = stackView.trailingAnchor.constraint(equalTo: titleLable.trailingAnchor)
        let stackBottom = stackView.bottomAnchor.constraint(equalTo: bottomBar.bottomAnchor)
        
        NSLayoutConstraint.activate([imgTop, imgLead, imgTrai, imgBottom, bottomBarLead, bottomBarTrai, bottomBarBottom, bottomBarHeight,
                                     titleTop, titleLead, titleTrai , stackTop, stackLead, stackTrai, stackBottom])
    }
    
    func fillView(image: UIImageView?, title: String, description: String){
        
    }
}
