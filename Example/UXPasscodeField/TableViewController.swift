//
//  TableViewController.swift
//  UXPasscodeField
//
//  Created by Eddie Hiu-Fung Lau on 21/12/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import UXPasscodeField

class TableViewController: UITableViewController {
    
    lazy var passcodeViewController: UXPasscodeViewController = {
        
        let vc = UXPasscodeViewController.instantiate()
        vc.title = "Passcode"
        vc.message = "Hello iOS developer! Please input your 4-digit code here."
        vc.numberOfDigits = 4
        vc.done { passcode in
            
            print(passcode)
            _ = vc.resignFirstResponder()
            
        }
        
        return vc
    }()

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1 {
            navigationController?.pushViewController(passcodeViewController, animated: true)
        }
    }

}
