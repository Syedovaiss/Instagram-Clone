//
//  AuthManager.swift
//  Instagram
//
//  Created by apple on 08/05/2023.
//

import Foundation

protocol AuthManagerProtocol {
    func registerUser(username:String,email:String,password:String)
    func loginUser(username:String?,email:String?,password:String)
    func isLoggedIn() -> Bool
}

class AuthManager : AuthManagerProtocol {
    
    init() {}
    
    private let databaseManager = DatabaseManager.shared
    
    func registerUser(username:String,email:String,password:String) {
        databaseManager.register(username: username, email: email, password: password)
    }
    
    func loginUser(username:String?,email:String?,password:String) {
        databaseManager.login(username: username, email: email, password: password)
        
    }
    
    func isLoggedIn() -> Bool {
        return databaseManager.isLoggedIn()
    }
}
