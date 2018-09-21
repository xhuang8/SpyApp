//
//  CipherFactory.swift
//  Spy-App
//
//  Created by XiaoQian Huang on 9/19/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import Foundation

struct CipherFactory {
    
    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Alphan": AlphanumericCesarCipher(),
        "Number": NumberCeaserCipher(),
        "Module": moduleCeaserCipher()
    ]
    
    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
