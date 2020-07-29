//
//  SecureStore.swift
//  Keychain
//
//  Created by Dimessi on 10/22/19.
//  Copyright © 2019 Dimessi. All rights reserved.
//

import Foundation

public struct SecureStore {
  let secureStoreQueryable: SecureStoreQueryable
  
  public init(secureStoreQueryable: SecureStoreQueryable) {
    self.secureStoreQueryable = secureStoreQueryable
  }
  
  public func setValue(_ value: String, for userAccount: String) throws {
    
    guard let encodedPassword = value.data(using: .utf8) else {
        print("Password can't be encoded")
        return
    }

    var query = secureStoreQueryable.query
    query[String(kSecAttrAccount)] = userAccount

    var status = SecItemCopyMatching(query as CFDictionary, nil)
    switch status {
    
    case errSecSuccess:
      var attributesToUpdate: [String: Any] = [:]
      attributesToUpdate[String(kSecValueData)] = encodedPassword
      
      status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
      if status == errSecSuccess {
          print("Account already exist and Password was updated")
      }
    
    case errSecItemNotFound:
      query[String(kSecValueData)] = encodedPassword
      
      status = SecItemAdd(query as CFDictionary, nil)
      if status == errSecSuccess {
          print("Password Added")
      }
    default:
      print("Default")
    }

  }
  
  public func getValue(for userAccount: String) throws -> String? {
    
    var query = secureStoreQueryable.query
    query[String(kSecMatchLimit)] = kSecMatchLimitOne
    query[String(kSecReturnAttributes)] = kCFBooleanTrue
    query[String(kSecReturnData)] = kCFBooleanTrue
    query[String(kSecAttrAccount)] = userAccount

    var queryResult: AnyObject?
    let status = withUnsafeMutablePointer(to: &queryResult) {
      SecItemCopyMatching(query as CFDictionary, $0)
    }

    switch status {
    
    case errSecSuccess:
      guard
        let queriedItem = queryResult as? [String: Any],
        let passwordData = queriedItem[String(kSecValueData)] as? Data,
        let password = String(data: passwordData, encoding: .utf8)
        else {
            print("Some thing goes rowng")
            return nil
        }
      return password
    
    case errSecItemNotFound:
    print("Password not found")
      return nil
    default:
    print("Default")
        return nil
    }

  }
  
  public func removeValue(for userAccount: String) throws {
    
    var query = secureStoreQueryable.query
    query[String(kSecAttrAccount)] = userAccount

    let status = SecItemDelete(query as CFDictionary)
    guard status == errSecSuccess || status == errSecItemNotFound
        else {
              print("Deletion error!")
                return
            }
    print("password deleted")
    }
  
  public func removeAllValues() throws {
    
    let query = secureStoreQueryable.query
      
    let status = SecItemDelete(query as CFDictionary)
    guard status == errSecSuccess || status == errSecItemNotFound else {
      print("removeAll Fail")
        return
    }

  }
}
