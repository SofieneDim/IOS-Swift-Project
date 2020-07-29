/**
 * Copyright (c) 2017 Razeware LLC
 *
 
 
 
 
 
 
 
 */
import UIKit

class CustomImageView: UIImageView {
  
  let progressIndicatorView = CircularLoaderView(frame: .zero)
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    addSubview(progressIndicatorView)
    progressIndicatorView.translatesAutoresizingMaskIntoConstraints = false

    let top = progressIndicatorView.topAnchor.constraint(equalTo: topAnchor)
    let leading = progressIndicatorView.leadingAnchor.constraint(equalTo: leadingAnchor)
    let width = progressIndicatorView.widthAnchor.constraint(equalToConstant: 200)
    let height = progressIndicatorView.heightAnchor.constraint(equalToConstant: 200)

    NSLayoutConstraint.activate([top, leading, width, height])
    
//    addConstraints(NSLayoutConstraint.constraints(
//              withVisualFormat: "V:|[v]|", options: .init(rawValue: 0),
//              metrics: nil, views: ["v": progressIndicatorView]))
//
//    addConstraints(NSLayoutConstraint.constraints(
//              withVisualFormat: "H:|[v]|", options: .init(rawValue: 0),
//              metrics: nil, views:  ["v": progressIndicatorView]))
    
    
    
    let url = URL(string: "https://koenig-media.raywenderlich.com/uploads/2015/02/mac-glasses.jpeg")
    sd_setImage(with: url, placeholderImage: nil, options: .cacheMemoryOnly, progress:
      { [weak self] receivedSize, expectedSize, _ in
        
        self?.progressIndicatorView.progress = CGFloat(receivedSize) / CGFloat(expectedSize)
        

      }) { [weak self] _, error, _, _ in
        // Reveal image here
    }
  }
  
}
