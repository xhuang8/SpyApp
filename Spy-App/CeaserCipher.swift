
//
//  CeaserCipher.swift
//  Spy-App
//
//  Created by XiaoQian Huang on 9/19/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decode(_ plaintext: String, secret: String) -> String?
}

//Ceasercipher
/*
 input: abcd
 secret: 3
 output for encode: defg
 output for decode: ^_'a
 */
struct CeaserCipher: Cipher {
    //encrypt
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    
     //decrypt
    func decode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
}

//AlphanumericCesarCipher
/*
 input: z09aB2
 secret: 1
 output for encode: 01ABC3 (output should be uppercased)
 output for decode: YZ89A1
 */
struct AlphanumericCesarCipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        let alphaPlaintext = plaintext.uppercased()
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in alphaPlaintext.uppercased() {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode + shiftBy
            if (shiftBy == 0)
            {
                return alphaPlaintext
            }
            //from the ASCII code, first thing we need to check if the unicode is aviablle when the user input something.
            if((unicode >= 48 && unicode <= 57) || (unicode >= 65 && unicode <= 90) || (unicode >= 97 && unicode <= 122))
            {
                if(shiftBy > 0)
                {
                    //if shiftedUnicode greater than 90-"Z", so go back to 0
                    if(shiftedUnicode > 90)
                    {
                        shiftedUnicode -= 43
                        //break
                    }
                    //if shiftedUnicode grater than 57-"9", so go back to A
                    else if(shiftedUnicode > 57 && shiftedUnicode < 65)
                    {
                        shiftedUnicode += 7
                        //break
                    }
                }
               /* else if(shiftBy < 0)
                {
                    if(shiftedUnicode < 48)
                    {
                        //if shiftedUnicode smaller than 48-"0", so go back to  Z
                        shiftedUnicode += 43
                        break
                    }
                        //if shitedUnicode smaller than 65-"A", so go back to 9
                    else if(shiftedUnicode < 65 && shiftedUnicode > 57)
                    {
                        shiftedUnicode -= 7
                        break
                    }
                }*/
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        
        }
        return encoded
        
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        let alphaPlaintext = plaintext.uppercased()
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decoded = ""
        for character in alphaPlaintext {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode - shiftBy
            if (shiftBy == 0)
            {
                return alphaPlaintext
            }
            //from the ASCII code, first thing we need to check if the unicode is aviablle when the user input something.
            if((unicode >= 48 && unicode <= 57) || (unicode >= 65 && unicode <= 90) || (unicode >= 97 && unicode <= 122))
            {
                if(shiftBy > 0)
                {
                    //if shiftedUnicode smaller than 65-"A", so go back to 9
                    if(shiftedUnicode < 48){
                        shiftedUnicode += 43
                        //break
                    }
                        //if shiftedUnicode smaller than 48-"0", so go back to Z
                    else if(shiftedUnicode > 57 && shiftedUnicode < 65){
                        shiftedUnicode -= 7
                        //break
                    }
                }
             /*   else if(shiftBy < 0)
                {
                    if(shiftedUnicode < 48)
                    {
                        //if shiftedUnicode smaller than 48-"0", so go back to  Z
                        shiftedUnicode += 43
                        break
                    }
                        //if shitedUnicode smaller than 65-"A", so go back to 9
                    else if(shiftedUnicode < 65 && shiftedUnicode > 57)
                    {
                        shiftedUnicode -= 7
                        break
                    }
                }*/
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
            
        }
        return decoded
    }
}

//NumberCeaserCipher
/*   input: a~z (input should be lowercased)
 output: should be 2 digits , the first one is that in 26 letter alphabetical order， second one is that Reverse order
 
 for example:
 input: acdzs
 output for encode: AZCXDWZASH
 */
extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}

struct NumberCeaserCipher: Cipher {
    //encrypt
    var number: [String : String ] = ["a":"AZ","b":"BY","c":"CX","d":"DW","e":"EV","f":"FU","g":"GT","h":"HS","i":"IR","j":"JQ","k":"KP","l":"LO","m":"MN","n":"NM","o":"OL","p":"PK","q":"QJ","r":"RI","s":"SH","t":"TG","u":"UF","v":"VE","w":"WD","x":"XC","y":"YB","z":"ZA"]
    
    
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        // numberPlaintext = plaintext.utf8.count
        for character in plaintext.lowercased() {
            //let unicode = character.unicodeScalars.first!.value
           // var shiftedUnicode = unicode
            /*if(unicode < 48 || unicode > 57)
            {
                return "error code"
            }
            else
            {*/
                if let num = number[String(character)]{
                    encoded = encoded + num + ""
                }
                else{
                    encoded = encoded + "error"
                }
                
            //}
           // let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
          //  encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    
    //decrypt
    func decode(_ plaintext: String, secret: String) -> String? {
       /*guard let shiftBy = UInt32(secret) else {
            return nil
        }*/
        var decoded = ""
        
        for character in plaintext.uppercased().components(separatedBy: ""){
            //let unicode = charc.unicodeScalars.first!.value

            // var shiftedUnicode = unicode
            /*if(unicode < 65 || unicode > 85)
            {
                return "error code"
            }
            else
            {*/
                if let num = number.someKey(forValue: character)
                {
                    decoded = decoded + num
                }
                else{
                    decoded = decoded + "error"
                }
                
           // }
            // let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            //  encoded = encoded + shiftedCharacter
        }
        return decoded
     }
}



//moduleCeaserCipher
/*
 input: plaintext ASCII CODE
 output: shiftBy mod 3 and plus 1
 
 for example:
 input: 4s9z6k
 secret: 2 (means shiftby 3 )
 output for encode: 7v<}9n
 output for encode: 1p6w3h
 */
struct moduleCeaserCipher: Cipher{
    //encrypt
    func encode(_ plaintext: String, secret: String) -> String? {
       // let modulePlaintext  = plaintext.lowercased()
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + (shiftBy % 3) + 1
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    
    //decrypt
    func decode(_ plaintext: String, secret: String) -> String? {
        //let modulePlaintext  = plaintext.lowercased()
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - ((shiftBy % 3) +  1)
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
}
    
    











