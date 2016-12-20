//
//  ViewController.swift
//  UXPasscodeField
//
//  Created by Eddie Lau on 12/19/2016.
//  Copyright (c) 2016 Eddie Lau. All rights reserved.
//

import UIKit
import UXPasscodeField

class ViewController: UIViewController {
    
    @IBOutlet weak var passcodeField: UXPasscodeField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        passcodeField.becomeFirstResponder()
        passcodeField.addTarget(self, action: #selector(ViewController.passcodeFieldDidChangeValue), for: .valueChanged)
        
    }

    @IBAction func passcodeFieldDidChangeValue() {
        print(passcodeField.passcode)
    }

}
