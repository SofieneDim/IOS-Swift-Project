//
//  CircularLoaderView.swift
//  ImageLoaderIndicator
//
//  Created by Dimessi on 10/2/19.
//  Copyright © 2019 Rounak Jain. All rights reserved.
//

import UIKit

class CircularLoaderView: UIView {

    let circlePathLayer = CAShapeLayer()
    let circleIndicatorLayer = CAShapeLayer()
    let circleRadius: CGFloat = 50.0
    
    var progress: CGFloat {
      get {
        return circlePathLayer.strokeEnd
      }
      set {
        if newValue > 1 {
          circlePathLayer.strokeEnd = 1
        } else if newValue < 0 {
          circlePathLayer.strokeEnd = 0
        } else {
          circlePathLayer.strokeEnd = newValue
        }
      }
    }

    
    override init(frame: CGRect) {
      super.init(frame: frame)
      configure()
    }

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      configure()
    }

    func configure() {
        
      progress = 0
      
      circleIndicatorLayer.frame = bounds
      circleIndicatorLayer.lineWidth = 5
      circleIndicatorLayer.fillColor = UIColor.clear.cgColor
      circleIndicatorLayer.strokeColor = UIColor.gray.cgColor
      layer.addSublayer(circleIndicatorLayer)

      circlePathLayer.frame = bounds
      circlePathLayer.lineWidth = 5
      circlePathLayer.fillColor = UIColor.clear.cgColor
      circlePathLayer.strokeColor = UIColor.red.cgColor
      layer.addSublayer(circlePathLayer)
    }

    func circleFrame() -> CGRect {
        
      var circleFrame = CGRect(x: 0, y: 0, width: 2 * circleRadius, height: 2 * circleRadius)
      let circlePathBounds = circlePathLayer.bounds
      circleFrame.origin.x = circlePathBounds.midX - circleFrame.midX
      circleFrame.origin.y = circlePathBounds.midY - circleFrame.midY
      return circleFrame
    }

    func circlePath() -> UIBezierPath {
      return UIBezierPath(ovalIn: circleFrame())
    }

    override func layoutSubviews() {
      super.layoutSubviews()
      circlePathLayer.frame = bounds
      circlePathLayer.path = circlePath().cgPath
        
      circleIndicatorLayer.frame = bounds
      circleIndicatorLayer.path = circlePath().cgPath
        
    }


}
