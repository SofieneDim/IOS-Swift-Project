//
//  MyTabBarController.swift
//  MyLocations
//
//  Created by Dimessi on 8/18/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import Foundation

import UIKit
class MyTabBarController: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override var childForStatusBarStyle: UIViewController? {
        return nil
    } }
