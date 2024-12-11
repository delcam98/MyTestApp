//
//  UserManager.swift
//  MyTestApp
//
//  Created by BPIMA_ALW1090 on 12/10/24.
//

// UserManager.swift

import Foundation

class UserManager {
   
    
    func registerUser(user:User) throws{
       
        //Validates user before register
        try UserValidator.validates(user:user)
       
        //Save user to list
        Database.saveUser(user: user)
       
        // Send welcome email
        EmailService.sendWelcomeEmail(email: user.email)
    }

    func authenticateUser(email: String, password: String) throws -> Bool {
        let user = Database.getUserByEmail(email: email)
        var isAuthenticated = false;
      
        isAuthenticated =  try UserValidator.userExists(user,pass: password)
       
        return isAuthenticated
    }
    
    
}

