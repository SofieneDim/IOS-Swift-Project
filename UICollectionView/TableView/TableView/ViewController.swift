//
//  ViewController.swift
//  TableView
//
//  Created by Dimessi on 10/16/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

struct data {
    var image: UIImage
    var title: String
    var description: String
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    
    private var content: [data] = [data(image: #imageLiteral(resourceName: "img0"), title: "Title0", description: "String, String, String, String, String, String, String, String, String, String, String, String, String, String, String, String, String, String 0"),
                                   data(image: #imageLiteral(resourceName: "img1"), title: "Title1", description: "Description 1"),
                                   data(image: #imageLiteral(resourceName: "img2"), title: "Title2", description: "Description 2"),
                                   data(image: #imageLiteral(resourceName: "img3"), title: "Title3", description: "Description 3"),
                                   data(image: #imageLiteral(resourceName: "img4"), title: "Title4", description: "Description 4"),
                                   data(image: #imageLiteral(resourceName: "img5"), title: "Title5", description: "Description 5"),
                                   data(image: #imageLiteral(resourceName: "img6"), title: "Title6", description: "Description 6"),
                                   data(image: #imageLiteral(resourceName: "img7"), title: "Title7", description: "Description 7"),
                                   data(image: #imageLiteral(resourceName: "img8"), title: "Title8", description: "Description 8"),
                                   data(image: #imageLiteral(resourceName: "img9"), title: "Title9", description: "Description 9")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupCVView()
    }

    func setupCVView(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        let collectionVTop = collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let collectionVLead = collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let collectionVTrai = collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let collectionVBottom = collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        NSLayoutConstraint.activate([collectionVTop, collectionVLead, collectionVTrai, collectionVBottom])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.setupView(image: content[indexPath.item].image, titleT: content[indexPath.item].title, descriptionT: content[indexPath.item].description)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width / 1.5)
    }
    
    
}

