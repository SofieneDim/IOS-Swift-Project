//
//  String+AddText.swift
//  MyLocations
//
//  Created by Dimessi on 8/18/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import Foundation

extension String {
    mutating func add(text: String?,
                      separatedBy separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text }
    } }
