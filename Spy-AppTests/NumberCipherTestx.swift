//
//  NumberCipherTestx.swift
//  Spy-AppTests
//
//  Created by XiaoQian Huang on 9/20/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import XCTest
@testable import Spy_App


class NumberCipherTestx: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = NumberCeaserCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual("AZ", result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret_one() {
        let plaintext = "AZ"
        
        let result = cipher.decode(plaintext, secret: "0")
        
        XCTAssertEqual("a", result)
    }
}
