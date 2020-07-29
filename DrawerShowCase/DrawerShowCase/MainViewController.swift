//
//  MainViewController.swift
//  DrawerShowCase
//
//  Created by HDimes on 9/21/19.
//  Copyright © 2019 Anypli. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var currentViewController: UIViewController?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = MainView(controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedMenu(menu: .home)
    }

}

// MARK:- MenuDelegate
extension MainViewController: MenuDelegate {
    func selectedMenu(menu: MenuEnum) {
        
        if let view = view as? MainView {
            view.closeMenu()
        }
        
        if menu == .logout {
            let logOutAlert = UIAlertController(title: "LogOut", message: "Confirm logout?", preferredStyle: .alert)
            let logoutAction = UIAlertAction(title: "LogOut", style: .destructive) { (action) in
                print("User did Logout")
                self.dismiss(animated: true, completion: nil)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            logOutAlert.addAction(logoutAction)
            logOutAlert.addAction(cancelAction)
            present(logOutAlert, animated: true, completion: nil)
            return
        }
        
        let selectedVC: UIViewController
        
        switch menu {
            
        case .home:
            let homeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
            
            let homeNav = HomeNavigationController(rootViewController: homeVC)
            homeVC.menuResponder = view as? MainView
            homeVC.delegate = homeNav
            selectedVC = homeNav
            
        case .profile:
            let profileVC = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
            profileVC.menuResponder = view as? MainView
            selectedVC = profileVC
        default:
            return
        }
        
        showViewController(selectedVC)
        
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
