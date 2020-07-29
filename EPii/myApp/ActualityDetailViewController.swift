//
//  DetailViewController.swift
//  EPii
//
//  Created by Dimessi on 9/20/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class ActualityDetailViewController: UIViewController {
    
    var item: resultsContent?
    let bgImage = UIImageView(image: UIImage(named: "Blur bg-1"))
    let mainImage = UIImageView()
    let darkL = UILabel()
    
    var images: [UIImage] = [UIImage(named: "placeholder")!]
    
    let pageControl = UIPageControl()
    let dateL = UILabel()
    let titleL = UILabel()
    let contentL = UILabel()
    let bottomLineView = UIImageView(image: UIImage(named: "BottomLine"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bgImage)
        
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainImage)
        if let bgImage = item?.img {
            mainImage.image = UIImage(named: bgImage)
        } else {
            mainImage.image = UIImage(named: "placeholder")
        }
        
        darkL.translatesAutoresizingMaskIntoConstraints = false
        darkL.backgroundColor = #colorLiteral(red: 0.4470072985, green: 0.44708848, blue: 0.4470021725, alpha: 1)
        view.addSubview(darkL)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = images.count
        view.addSubview(pageControl)
        
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomLineView)
        
        dateL.translatesAutoresizingMaskIntoConstraints = false
        dateL.font = UIFont.systemFont(ofSize: 15)
        dateL.text = item?.date
        dateL.numberOfLines = 2
        dateL.textColor = #colorLiteral(red: 0.8010886312, green: 0.1333375275, blue: 0.1651354134, alpha: 1)
        view.addSubview(dateL)
        
        titleL.translatesAutoresizingMaskIntoConstraints = false
        titleL.text = item?.title
        titleL.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(titleL)
        
        contentL.translatesAutoresizingMaskIntoConstraints = false
        contentL.text = item?.content
        contentL.font = UIFont.systemFont(ofSize: 17)
        contentL.numberOfLines = 0
        view.addSubview(contentL)
        
        setupView()
    }
    
    func setupView(){
        
        let bgTop = bgImage.topAnchor.constraint(equalTo: view.topAnchor)
        let bgLeading = bgImage.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let bgTrailing = bgImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bgBottom = bgImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        let imageTop = mainImage.topAnchor.constraint(equalTo: view.topAnchor)
        let imageLeading = mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let imageTrailing = mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let imageHeigth = mainImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        
        let darkHeight = darkL.heightAnchor.constraint(equalTo: mainImage.heightAnchor, multiplier: 0.17)
        let darkLeading = darkL.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let darkTrailing = darkL.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let darkBottom = darkL.bottomAnchor.constraint(equalTo: bottomLineView.topAnchor)
        
        let pageCentreX = pageControl.centerXAnchor.constraint(equalTo: darkL.centerXAnchor)
        let pageCentreY = pageControl.centerYAnchor.constraint(equalTo: darkL.centerYAnchor)
        
        let lineHeight = bottomLineView.heightAnchor.constraint(equalToConstant: 3)
        let lineLeading = bottomLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let lineTrailing = bottomLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let lineTop = bottomLineView.topAnchor.constraint(equalTo: mainImage.bottomAnchor)
        
        let dateTop = dateL.topAnchor.constraint(equalTo: bottomLineView.bottomAnchor, constant: 20)
        let dateLeading = dateL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let dateWidht = dateL.widthAnchor.constraint(equalToConstant: 50)
        let dateHeigth = dateL.heightAnchor.constraint(equalToConstant: 50)
        
        let titleTop = titleL.topAnchor.constraint(equalTo: bottomLineView.bottomAnchor, constant: 20)
        let titleLeading = titleL.leadingAnchor.constraint(equalTo: dateL.trailingAnchor, constant: 10)
        let titleTrailing = titleL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        let titleHeigth = titleL.heightAnchor.constraint(equalToConstant: 50)
        
        let contentTop = contentL.topAnchor.constraint(equalTo: titleL.bottomAnchor, constant: 20)
        let contentLeading = contentL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let contentTrailing = contentL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        
        NSLayoutConstraint.activate([bgTop, bgTrailing, bgLeading, bgBottom,
                                     dateTop, dateWidht, dateHeigth, dateLeading,
                                     imageTop, imageHeigth, imageLeading, imageTrailing,
                                     darkBottom, darkHeight, darkLeading, darkTrailing,
                                     pageCentreX, pageCentreY,
                                     lineHeight, lineTop, lineLeading, lineTrailing,
                                     titleTop, titleHeigth, titleLeading, titleTrailing,
                                     contentTop, contentLeading, contentTrailing])
    }

}
