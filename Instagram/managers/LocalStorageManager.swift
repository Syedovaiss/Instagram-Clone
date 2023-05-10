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
}

class LocalStorageManager : LocalStorageManagerProtocol {
    
    private let storage = UserDefaults()
    
    func setUsername(username: String) {
        storage.set(username, forKey: KEY_USERNAME)
    }
    func getUsername() -> String {
        return (storage.value(forKey: KEY_USERNAME) as! String?).orDefault()
    }
}
