//
//  ValidationError.swift
//  MyTestApp
//
//  Created by BPIMA_ALW1090 on 12/10/24.
//

import Foundation


enum ValidationError:Error {
    case requiredFields
    case invalidPassword
    case invalidEmail
    case invalidAge
    case userNotFound
    
}
