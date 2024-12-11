//
//  UserValidator.swift
//  MyTestApp
//
//  Created by BPIMA_ALW1090 on 12/10/24.
//

import Foundation

class UserValidator{
    static func validates(user: User) throws {
        
        if user.firstName.isEmpty || user.lastName.isEmpty || user.email.isEmpty || user.password.isEmpty {
            throw ValidationError.requiredFields
        }
        if !user.email.contains("@") {
            throw ValidationError.invalidEmail
        }
        if user.password.count < 6 {
            throw ValidationError.invalidPassword
        }
        if user.age < 18 {
            throw ValidationError.invalidAge
        }
    }
    
    static func userExists(_ user: User?, pass: String)throws -> Bool{
        guard let user else{
            throw ValidationError.userNotFound
        }
        return user.password == pass;
      
    }
}
