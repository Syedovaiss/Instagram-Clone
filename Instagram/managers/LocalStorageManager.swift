//
//  LocalStorageManager.swift
//  Instagram
//
//  Created by apple on 09/05/2023.
//

import Foundation

protocol LocalStorageManagerProtocol {
    func setUsername(username:String)
    func getUsername() -> String
    func setFullname(name:String)
    func getFullname() -> String
    func setAccountSecurity(type:AccountType)
    func getAccountType() -> AccountType
    func clear()
}

class LocalStorageManager : LocalStorageManagerProtocol {
    
    static let shared = LocalStorageManager()
    private let storage = UserDefaults()
    
    func setUsername(username: String) {
        storage.set(username, forKey: KEY_USERNAME)
    }
    func getUsername() -> String {
        return (storage.value(forKey: KEY_USERNAME) as! String?).orDefault()
    }
    
    func setFullname(name:String) {
        storage.set(name, forKey: KEY_FULLNAME)
    }
    
    func getFullname() -> String {
        return (storage.value(forKey: KEY_FULLNAME) as! String?).orDefault()
    }
    
    func setAccountSecurity(type: AccountType) {
        storage.set(type, forKey: KEY_ACCOUNT_TYPE)
    }
    
    func getAccountType() -> AccountType {
        if storage.value(forKey: KEY_ACCOUNT_TYPE) != nil  {
            return storage.value(forKey: KEY_ACCOUNT_TYPE) as! AccountType
        } else {
            return AccountType.PUBLIC
        }
    }
    func clear() {
        UserDefaults.resetStandardUserDefaults()
    }
    
}
