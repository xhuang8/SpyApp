//
//  AlphanumericCesarCipherTests.swift
//  Spy-AppTests
//
//  Created by XiaoQian Huang on 9/20/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import XCTest
@testable import Spy_App

class AlphanumericCesarCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = AlphanumericCesarCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext.uppercased(), result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret_one() {
        let plaintext = "z"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual("0", result)
    }
    
    func test_nonNumericInputForSecret_one() {
        let result = cipher.encode("9", secret: "1")
        
        XCTAssertNil(result)
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret_three() {
        let plaintext = "A"
        
        let result = cipher.decode(plaintext, secret: "1")
        
        XCTAssertEqual("9", result)
    }
    
    func test_nonNumericInputForSecret_three() {
        let result = cipher.decode("0", secret: "1")
        
        XCTAssertNil(result)
    }
    
}
