//
//  MainView.swift
//  DrawerShowCase
//
//  Created by HDimes on 9/21/19.
//  Copyright © 2019 Anypli. All rights reserved.
//

import UIKit

protocol MenuResponder: class {
    func showMenu()
    func closeMenu()
}

class MainView: UIView, MenuResponder {
    
    let controller: MainViewController
    var _leadingConstraint: NSLayoutConstraint!
    let _dimView = UIView(frame: .zero)
    
    var _leftEdgeGesture: UIScreenEdgePanGestureRecognizer!
    var _rightSwipeGesture: UIPanGestureRecognizer!

    init(controller: MainViewController) {
        self.controller = controller
        super.init(frame: .zero)
        backgroundColor = .white
        
        layoutViews()
        setUpGestures()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutViews() {
        addSubview(_dimView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleMenu))
        _dimView.addGestureRecognizer(tapGesture)
        
        _dimView.isHidden = true
        _dimView.backgroundColor = .black
        _dimView.alpha = 0.7
        _dimView.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = _dimView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailing = _dimView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let top = _dimView.topAnchor.constraint(equalTo: topAnchor)
        let bottom = _dimView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        let menuView = MenuView(delegate: controller)
        menuView.backgroundColor = .blue
        menuView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(menuView)
        
        let widthCOnstraint = menuView.widthAnchor.constraint(equalToConstant: MenuView.MenuWidth)
        _leadingConstraint = menuView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -widthCOnstraint.constant)
        let topConstraint = menuView.topAnchor.constraint(equalTo: topAnchor)
        let bottomConstraint = menuView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        NSLayoutConstraint.activate([_leadingConstraint,
                                     widthCOnstraint,
                                     topConstraint,
                                     bottomConstraint,
                                     leading,
                                     trailing,
                                     top,
                                     bottom
            ])
    }
    
    func setUpGestures() {
        _leftEdgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(dragMenu(sender:)))
        _leftEdgeGesture.edges = [.left]
        addGestureRecognizer(_leftEdgeGesture)
        
        _rightSwipeGesture = UIPanGestureRecognizer(target: self, action: #selector(closeMenu(sender:)))
        _rightSwipeGesture.isEnabled = false
        addGestureRecognizer(_rightSwipeGesture)
    }
    
    @objc
    func dragMenu(sender: UIScreenEdgePanGestureRecognizer) {
        _dimView.isHidden = false
        let x = sender.location(in: self).x
        if sender.state == .ended {
            if x > MenuView.MenuWidth / 2 {
                _leadingConstraint.constant = 0
                sender.isEnabled = false
                _rightSwipeGesture.isEnabled = true
            } else {
                _leadingConstraint.constant = -MenuView.MenuWidth
                _dimView.isHidden = true
            }
            UIView.animate(withDuration: 0.2) {
                self.layoutIfNeeded()
            }
        } else {
            _leadingConstraint.constant = x > MenuView.MenuWidth ? 0 : -MenuView.MenuWidth + x
        }
    }
    
    @objc
    func closeMenu(sender: UIPanGestureRecognizer) {
        let x = sender.translation(in: self).x
        if sender.state == .ended {
            if x > -MenuView.MenuWidth / 2 {
                _leadingConstraint.constant = 0
            } else {
                _leadingConstraint.constant = -MenuView.MenuWidth
                _dimView.isHidden = true
                sender.isEnabled = false
                _leftEdgeGesture.isEnabled = true
            }
            UIView.animate(withDuration: 0.2) {
                self.layoutIfNeeded()
            }
        } else {
            var const = x
            if x < -MenuView.MenuWidth {
                const = -MenuView.MenuWidth
            }
            if x > 0 {
                const = 0
            }
            _leadingConstraint.constant = const
        }
    }
    
    @objc
    func toggleMenu() {
        if _leadingConstraint.constant == 0 {
            closeMenu()
        } else {
            showMenu()
        }
        
        
        
    }
    
    func closeMenu() {
        _leadingConstraint.constant = -MenuView.MenuWidth
        _dimView.isHidden = true
        _leftEdgeGesture.isEnabled = true
        _rightSwipeGesture.isEnabled = false
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    func showMenu() {
        _leadingConstraint.constant = 0
        _dimView.isHidden = false
        _rightSwipeGesture.isEnabled = true
        _leftEdgeGesture.isEnabled = false
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
}
