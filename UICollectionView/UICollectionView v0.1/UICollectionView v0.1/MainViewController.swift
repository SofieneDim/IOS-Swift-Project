//
//  ViewController.swift
//  UICollectionView v0.1
//
//  Created by Dimessi on 10/14/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let imgs: [UIImage] = [UIImage(named: "img0")!, UIImage(named: "img1")!, UIImage(named: "img2")!,
                           UIImage(named: "img3")!, UIImage(named: "img4")!, UIImage(named: "img5")!,
                           UIImage(named: "img6")!, UIImage(named: "img7")!, UIImage(named: "img8")!,
                           UIImage(named: "img9")!, UIImage(named: "img10")!, UIImage(named: "img11")!,
                           UIImage(named: "img12")!, UIImage(named: "img13")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = MainView(images: imgs)
        
    }

}
