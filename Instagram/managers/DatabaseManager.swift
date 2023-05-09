//
//  DatabaseManager.swift
//  Instagram
//
//  Created by ovais on 08/05/2023.
//

import Foundation
import Firebase

protocol DatabaseManagerProtocol {
    func register(username:String,email:String,password:String,completion: @escaping (Bool) -> Void)
    func login(username:String,password:String,completion: @escaping (Bool) -> Void)
    func isLoggedIn() -> Bool
    func canCreateAccount(username:String,completion:@escaping(Bool) -> Void)
}
public class DatabaseManager : DatabaseManagerProtocol {
    
    static let shared = DatabaseManager()
    let database = Database.database().reference()
    
    func register(username:String,email:String,password:String,completion: @escaping(Bool) -> Void) {
        Auth.auth().createUser(withEmail: "\(username)@instagram.com", password: password) { results, errors in
            if errors != nil {
                completion(false)
            } else {
                self.database.child(USER_REFERENCE).child(username).setValue(["email":email,"password":password]) {
                    databaseError, reference in
                    if databaseError != nil {
                        completion(false)
                    } else {
                        completion(true)
                    }
                }
            }
        }
    }
    
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        database.child(USER_REFERENCE).child(username).getData { dataError,snapshot in
            if dataError != nil {
                completion(false)
            } else {
                Auth.auth().signIn(withEmail: "\(username)@instagram.com", password: password) { authDataResults,  authError in
                    if authError != nil {
                        completion(false)
                    } else {
                        completion(true)
                    }
                }
            }
        }
    }
    
    
    func isLoggedIn() -> Bool {
        if Auth.auth().currentUser == nil {
            return false
        } else {
            return true
        }
    }
    
    func canCreateAccount(username:String,completion:@escaping(Bool) -> Void)  {
        database.child(USER_REFERENCE).child(username).getData(completion: { error, _ in
            if error != nil {
                completion(false)
            } else {
                completion(true)
            }
        })
    }
    
}
