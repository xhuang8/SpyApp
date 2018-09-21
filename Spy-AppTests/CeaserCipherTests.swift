//
//  CeaserCipherTests.swift
//  Spy-AppTests
//
//  Created by XiaoQian Huang on 9/19/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import XCTest
@testable import Spy_App

class CeaserCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = CeaserCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret_one() {
        let plaintext = "f"
        
        let result = cipher.encode(plaintext, secret: "2")
        
        XCTAssertEqual("h", result)
    }
    
}
