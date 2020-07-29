//
//  ContainerViewController.swift
//  EPii
//
//  Created by Dimessi on 9/20/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import UIKit
import QuartzCore

class ContainerViewController: UIViewController {
    
    var MenuLeadingConstraint: NSLayoutConstraint!
    let _darkView = UIView(frame: .zero)
    
    var _leftEdgeGesture: UIScreenEdgePanGestureRecognizer!
    var _rightSwipeGesture: UIPanGestureRecognizer!
    
    var currentViewController: UIViewController?
    
    var token: String = ""
    var userId: String = ""
    var roleId: String = ""
    let MenuWidht = UIScreen.main.bounds.width * 0.75
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Menu icon"), style: .plain, target: self, action: #selector(toggleMenu))
        
        _leftEdgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(dragMenu))
        _leftEdgeGesture.edges = [.left]
        view.addGestureRecognizer(_leftEdgeGesture)
        
        _rightSwipeGesture = UIPanGestureRecognizer(target: self, action: #selector(closeMenu))
        _rightSwipeGesture.isEnabled = false
        view.addGestureRecognizer(_rightSwipeGesture)
        
        view.addSubview(_darkView)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleMenu))
        _darkView.addGestureRecognizer(tapGesture)

        _darkView.isHidden = true
        _darkView.backgroundColor = .black
        _darkView.alpha = 0.7
        _darkView.translatesAutoresizingMaskIntoConstraints = false

        let darkViewLeading = _darkView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let darkViewTrailing = _darkView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let darkViewTop = _darkView.topAnchor.constraint(equalTo: view.topAnchor)
        let darkViewBottom = _darkView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        let MenuView = SideMenuViewController()
        MenuView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(MenuView)
        let MenuWidthC = MenuView.widthAnchor.constraint(equalToConstant: MenuWidht)
        MenuLeadingConstraint = MenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -MenuWidht)
        let MenuTopConstraint = MenuView.topAnchor.constraint(equalTo: view.topAnchor)
        let MenuBottomConstraint = MenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        NSLayoutConstraint.activate([MenuLeadingConstraint, MenuWidthC, MenuTopConstraint, MenuBottomConstraint,
                                     darkViewLeading, darkViewTrailing, darkViewTop, darkViewBottom])
        
        
        let ActualityVC = ActualityViewController()
        ActualityVC.token = token
        showViewController(ActualityVC)
        navigationController?.navigationBar.topItem?.title = "Actualités"

        let name = Notification.Name(Note)
        NotificationCenter.default.addObserver(self, selector: #selector(selected), name: name, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func selected(notification: Notification){
        itemSelected(menu: notification.object as! MenuEnum)
    }
    
}

extension ContainerViewController {
    
     func itemSelected(menu: MenuEnum) {

        closeMen()
        if menu == .Deconnecter {
            dismiss(animated: false, completion: nil)
        }

        switch menu {
        case .Actualités:

            navigationItem.rightBarButtonItem = nil
            navigationController?.navigationBar.topItem?.title = "Actualités"
            let ActualityVC = ActualityViewController()
            ActualityVC.token = token
            showViewController(ActualityVC)

        case .Notes:

            navigationItem.rightBarButtonItem = nil
            navigationController?.navigationBar.topItem?.title = "Notes d'info"
            let Note = NotesViewController()

            Note.userId = userId
            Note.token = token
            showViewController(Note)

        case .Emploi:

            navigationItem.rightBarButtonItem = nil
            navigationController?.navigationBar.topItem?.title = "Emploi de temps"
            let Emploi = EmploiViewController()

            Emploi.userId = userId
            Emploi.token = token
            showViewController(Emploi)

        case .Abscences:

            navigationItem.rightBarButtonItem = nil
            navigationController?.navigationBar.topItem?.title = "Abscences"
            let Abscences = AbscencesViewController()
            Abscences.token = token
            Abscences.userId = userId
            Abscences.roleId = roleId
            showViewController(Abscences)

        case .Mentions:

            navigationItem.rightBarButtonItem = nil
            navigationController?.navigationBar.topItem?.title = "Mention légales"
            let MentionsVC = MentionsViewController()
            showViewController(MentionsVC)
//
//        case .Apropos:

//            navigationItem.rightBarButtonItem = nil
//            navigationController?.navigationBar.topItem?.title = "À propos"
//            let Apropos = storyboard!.instantiateViewController(withIdentifier: "Apropos") as? AproposViewController
//            showViewController(Apropos!)

        default: return
        }
    }
    
    func showViewController(_ vc: UIViewController) {
        currentViewController?.removeFromParent()
        currentViewController?.view.removeFromSuperview()
        
        addChild(vc)
        view.addSubview(vc.view)
        view.sendSubviewToBack(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        let leading = vc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailing = vc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        let top = vc.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let bottom = vc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        NSLayoutConstraint.activate([leading, trailing, top, bottom])
        vc.didMove(toParent: self)
        
        currentViewController = vc
    }
    
}


extension ContainerViewController {

    func showMenu() {
        MenuLeadingConstraint.constant = 0
        _darkView.isHidden = false
        _rightSwipeGesture.isEnabled = true
        _leftEdgeGesture.isEnabled = false
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }

    @objc func toggleMenu() {
        if MenuLeadingConstraint.constant == 0 {
            closeMen()
        } else {
            showMenu()
        }
    }
    
    @objc func dragMenu(sender: UIScreenEdgePanGestureRecognizer) {
        _darkView.isHidden = false

        let x = sender.location(in: self.view).x
        if sender.state == .ended {
            if x > MenuWidht / 2 {
                MenuLeadingConstraint.constant = 0
                sender.isEnabled = false
                _rightSwipeGesture.isEnabled = true
            } else {
                MenuLeadingConstraint.constant = -MenuWidht
                _darkView.isHidden = true
            }
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        } else {
            MenuLeadingConstraint.constant = x > MenuWidht ? 0 : -MenuWidht + x
        }
    }
    
    @objc func closeMenu(sender: UIPanGestureRecognizer) {
        let x = sender.translation(in: view).x
        if sender.state == .ended {
            if x > -MenuWidht / 2 {
                MenuLeadingConstraint.constant = 0
            } else {
                MenuLeadingConstraint.constant = -MenuWidht
                _darkView.isHidden = true
                sender.isEnabled = false
                _leftEdgeGesture.isEnabled = true
            }
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        } else {
            var const = x
            if x < -MenuWidht {
                const = -MenuWidht
            }
            if x > 0 {
                const = 0
            }
            MenuLeadingConstraint.constant = const
        }
    }

    func closeMen() {
        MenuLeadingConstraint.constant = -MenuWidht
        _darkView.isHidden = true
        _leftEdgeGesture.isEnabled = true
        _rightSwipeGesture.isEnabled = false
        UIView.animate(withDuration: 0.7) {
            self.view.layoutIfNeeded()
        }
    }
}
