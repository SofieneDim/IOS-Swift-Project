//
//  SecureStoreQueryable.swift
//  Keychain
//
//  Created by Dimessi on 10/22/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import Foundation

public protocol SecureStoreQueryable {
  var query: [String: Any] { get }
}

public struct GenericPasswordQueryable {
  let service: String
  let accessGroup: String?
  
  init(service: String, accessGroup: String? = nil) {
    self.service = service
    self.accessGroup = accessGroup
  }
}

extension GenericPasswordQueryable: SecureStoreQueryable {
  public var query: [String: Any] {
    var query: [String: Any] = [:]
    query[String(kSecClass)] = kSecClassGenericPassword
    query[String(kSecAttrService)] = service
    // Access group if target environment is not simulator
    #if !targetEnvironment(simulator)
    if let accessGroup = accessGroup {
      query[String(kSecAttrAccessGroup)] = accessGroup
    }
    #endif
    return query
  }
}
