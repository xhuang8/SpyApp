//
//  ModuleCipherTests.swift
//  Spy-AppTests
//
//  Created by XiaoQian Huang on 9/20/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import XCTest
@testable import Spy_App

class ModuleCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = moduleCeaserCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "2")
        
        XCTAssertEqual("d", result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
    
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret_one() {
        let plaintext = "z"
        
        let result = cipher.encode(plaintext, secret: "2")
        
        XCTAssertEqual("}", result)
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret_two() {
        let plaintext = "a"
        
        let result = cipher.decode(plaintext, secret: "2")
        
        XCTAssertEqual("^", result)
    }
    
}
