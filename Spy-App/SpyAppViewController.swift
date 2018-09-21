//
//  ViewController.swift
//  Spy-App
//
//  Created by XiaoQian Huang on 9/19/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit

class SpyAppViewController: UIViewController {

    
    @IBOutlet weak var Input: UITextField!
    
    @IBOutlet weak var Secret: UITextField!
    
    @IBOutlet weak var Output: UILabel!
    
    let factory = CipherFactory()
    var cipher: Cipher?
    
    var plaintext: String {
        if let text = Input.text {
            return text
        } else {
            return ""
        }
    }
    
    var secretText: String {
        if let text = Secret.text {
            return text
        } else {
            return ""
        }
    }
    
    
    @IBAction func encodeButtonPressed(_ sender: UIButton)
    {
        guard let cipher = self.cipher else {
            Output.text = "No cipher selected"
            return
        }
        if let encoded = cipher.encode(plaintext, secret: secretText) {
            Output.text = encoded
        } else {
            Output.text = "Error encoding"
        }
    }
    
    
    @IBAction func decodeButtonPressed(_ sender: UIButton)
    {
        guard let cipher = self.cipher else {
            Output.text = "No cipher selected"
            return
        }
        if let decoded = cipher.decode(plaintext, secret: secretText) {
            Output.text = decoded
        } else {
            Output.text = "Error encoding"
        }
    }
    
    
    @IBAction func cipherButtonPressed(_ sender: UIButton)
    {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
            else {
                Output.text = "No button or no button text"
                return
        }
        cipher = factory.cipher(for: buttonText)
    }
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }*/


}

