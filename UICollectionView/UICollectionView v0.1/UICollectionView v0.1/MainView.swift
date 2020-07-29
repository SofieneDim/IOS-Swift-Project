//
//  MainView.swift
//  UICollectionView v0.1
//
//  Created by Dimessi on 10/14/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    var imgs: [UIImage]
    
    let collection: UICollectionView = {
       let cv = UICollectionView(frame: .zero, collectionViewLayout: MainCVLayout())
        cv.backgroundColor = .white
        cv.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow: CGFloat = 2

    init(images: [UIImage]){
        
        self.imgs = images
        
        super.init(frame: .zero)
        backgroundColor = .white
        
        if let layout = collection.collectionViewLayout as? MainCVLayout {
          layout.delegate = self
        }
        
        collection.dataSource = self
        collection.delegate = self
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        collection.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collection)
        let collectTop = collection.topAnchor.constraint(equalTo: topAnchor, constant: sectionInsets.top)
        let collectLead = collection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sectionInsets.left)
        let collectTrai = collection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sectionInsets.right)
        let collectBottom = collection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -sectionInsets.bottom)
        NSLayoutConstraint.activate([collectTop, collectLead, collectTrai, collectBottom])
    }
    
}

extension MainView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        cell.bg.image = imgs[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.item == imgs.count - 3 {
            imgs += [UIImage(named: "img0")!, UIImage(named: "img1")!, UIImage(named: "img2")!,
            UIImage(named: "img3")!, UIImage(named: "img4")!, UIImage(named: "img5")!,
            UIImage(named: "img6")!, UIImage(named: "img7")!, UIImage(named: "img8")!,
            UIImage(named: "img9")!, UIImage(named: "img10")!, UIImage(named: "img11")!,
            UIImage(named: "img12")!, UIImage(named: "img13")!]
            
            collection.reloadData()
            //collection.collectionViewLayout.invalidateLayout()
        }
    }
}

extension MainView: MainLayoutDelegate {
  func collectionView(_ collectionView: UICollectionView,
                      heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    
    return imgs[indexPath.item].size.height
  }
}
