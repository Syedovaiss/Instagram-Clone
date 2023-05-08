//
//  DatabaseManager.swift
//  Instagram
//
//  Created by apple on 08/05/2023.
//

import Foundation
import Firebase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    
    func register(username:String,email:String,password:String) {
        
    }
    
    func login(username:String?,email:String?,password:String) {
        
    }
    
    func isLoggedIn() -> Bool {
        if Auth.auth().currentUser == nil {
            return false
        } else {
            return true
        }
    }
    
}
