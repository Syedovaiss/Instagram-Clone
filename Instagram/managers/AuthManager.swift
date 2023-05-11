//
//  AuthManager.swift
//  Instagram
//
//  Created by ovais on 08/05/2023.
//

import Foundation
import Firebase

protocol AuthManagerProtocol {
    func registerUser(username:String,email:String,password:String,completion: @escaping(Bool) ->Void)
    func loginUser(username:String?,password:String,completion: @escaping(Bool) ->Void)
    func isLoggedIn() -> Bool
    func logout()
}

class AuthManager : AuthManagerProtocol {
    
    init() {}
    
    private let databaseManager = DatabaseManager.shared
    
    func registerUser(username:String,email:String,password:String,completion: @escaping (Bool) ->Void) {
        databaseManager.canCreateAccount(username: username, completion: { canCreate in
            if canCreate {
                self.databaseManager.register(username: username, email: email, password: password) { isRegistered in
                    if isRegistered {
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            } else {
                completion(false)
            }
        })
    }
    
    func loginUser(username:String?,password:String,completion: @escaping(Bool) ->Void) {
        if let username = username {
            databaseManager.login(username: username, password: password, completion: completion)
        }
        
    }
    
    func isLoggedIn() -> Bool {
        return databaseManager.isLoggedIn()
    }
    
    func logout() {
        removeDataFromFirebaseAuth()
    }
    
    private func removeDataFromFirebaseAuth() {
        do {
            try Auth.auth().signOut()
        } catch {

        }
    }
}
