//
//  CVView.swift
//  HorizontalRowSwipe
//
//  Created by Dimessi on 10/14/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

struct customData {
    var title: String
    var image: UIImage
    var url: String
}

class CVView: UIView {
    
    let data = [
        customData(title: "title1", image: #imageLiteral(resourceName: "img1"), url: ""),
        customData(title: "title2", image: #imageLiteral(resourceName: "img2"), url: ""),
        customData(title: "title3", image: #imageLiteral(resourceName: "img3"), url: ""),
        customData(title: "title4", image: #imageLiteral(resourceName: "img4"), url: "")
    ]
    
    let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CVCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        collectionView.backgroundColor = .white
        backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        let CVCentreY = collectionView.centerYAnchor.constraint(equalTo: centerYAnchor)
        let CVTrailing = collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let CVLeading = collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        let CVHeight = collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5)
        
        NSLayoutConstraint.activate([CVCentreY, CVHeight, CVLeading, CVTrailing])
    }
    
}

extension CVView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CVCell
        cell.data = self.data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print(indexPath)
    }
    
}
