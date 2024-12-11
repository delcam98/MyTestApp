//
//  UserManagerTest.swift
//  MyTestAppTests
//
//  Created by BPIMA_ALW1090 on 12/10/24.
//

import XCTest
@testable import MyTestApp

final class UserManagerTest: XCTestCase {

    var userManager: UserManager!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        userManager = UserManager()
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        userManager = nil
    }

   
    func testRegisterUserValidUser() throws {
       //Given
        let user  = User(firstName:"Luis",lastName:"Delgado",email:"delgado@popular.com",password:"blahhhh",age:34)
        
        //When register user is called
        XCTAssertNoThrow(try userManager.registerUser(user:user))
    }
    
    func testRegisterUserEmptyFirstname() throws {
       //Given
        let user  = User(firstName:"",lastName:"Delgado",email:"delgado@popular.com",password:"blahhhh",age:34)
        
       // Test case: name and email are both nil, should trigger fatalError
       XCTAssertThrowsError(try userManager.registerUser(user: user)
       , "Expected fatalError to be called, but it wasn't.") { error in
           XCTAssertNotNil(error)
       }
    }
    
    func testRegisterUserEmptyLastname() throws {
       //Given
        let user  = User(firstName:"Faustino",lastName:"",email:"delgado@popular.com",password:"blahhhh",age:34)
        
       // Test case: name and email are both nil, should trigger fatalError
       XCTAssertThrowsError(try userManager.registerUser(user: user)
       , "Expected fatalError to be called, but it wasn't.") { error in
           XCTAssertNotNil(error)
       }
    }
    
    func testRegisterInvalidEmail() throws {
       //Given
        let user  = User(firstName:"Faustino",lastName:"Delgado",email:"paper",password:"blahhhh",age:34)
        
       // Test case: name and email are both nil, should trigger fatalError
       XCTAssertThrowsError(try userManager.registerUser(user: user)
       , "Expected fatalError to be called, but it wasn't.") { error in
           XCTAssertNotNil(error)
       }
    }
    
    func testRegisterUserEmptyInvalidPassword() throws {
       //Given
        let user  = User(firstName:"Faustino",lastName:"Delgado",email:"delgado@popular.com",password:"123",age:34)
        
       // Test case: name and email are both nil, should trigger fatalError
       XCTAssertThrowsError(try userManager.registerUser(user: user)
       , "Expected fatalError to be called, but it wasn't.") { error in
           XCTAssertNotNil(error)
       }
    }
    
    func testRegisterUserWrongAge() throws {
       //Given
        let user  = User(firstName:"Faustino",lastName:"Delgado",email:"delgado@popular.com",password:"blahhhh",age:17)
        
       // Test case: name and email are both nil, should trigger fatalError
       XCTAssertThrowsError(try userManager.registerUser(user: user)
       , "Expected fatalError to be called, but it wasn't.") { error in
           XCTAssertNotNil(error)
           print(String(describing: error) == String(describing: ValidationError.requiredFields))
       }
    }
    
    func testAutthenticateNonExistingUser() throws {
       //Given
        let email = "camacho@popular.com"
        let pass = "blahhhh"
        
       // Test case: name and email are both nil, should trigger fatalError
        XCTAssertThrowsError(try userManager.authenticateUser(email: email, password: pass)
       , "Expected fatalError to be called, but it wasn't.") { error in
           XCTAssertNotNil(error)
           print(String(describing: error) == String(describing: ValidationError.requiredFields))
       }
    }
    
    func testAuthenticaValidUser() throws {
       //Given
        let user  = User(firstName:"Luis",lastName:"Delgado",email:"delgado@popular.com",password:"blahhhh",age:34)
        
        //When register user is called
        XCTAssertNoThrow(try userManager.registerUser(user:user))
        let userExists = try userManager.authenticateUser(email: user.email, password: user.password)
        XCTAssertTrue(userExists)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
