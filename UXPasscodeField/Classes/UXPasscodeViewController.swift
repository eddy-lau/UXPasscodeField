//
//  UXPasscodeViewController.swift
//  Pods
//
//  Created by Eddie Hiu-Fung Lau on 20/12/2016.
//
//

import UIKit

public class UXPasscodeViewController: UITableViewController {
    
    // MARK: - Public variables
    public var message: String? {
        didSet {
            if isViewLoaded {
                messageLabel.text = message
            }
        }
    }
    
    public var numberOfDigits = 6 {
        didSet {
            if isViewLoaded {
                passcodeField.numberOfDigits = numberOfDigits
            }
        }
    }

    // MARK: - Private variables
    @IBOutlet weak fileprivate var passcodeField: UXPasscodeField!
    @IBOutlet weak fileprivate var messageLabel: UILabel!
    fileprivate var doneAction: ((_ passcode:String)->Void)?
    
    // MARK: - UIViewController
    override public func viewDidLoad() {
        super.viewDidLoad()

        if let message = message {
            messageLabel.text = message
        }
        passcodeField.numberOfDigits = numberOfDigits
        
        passcodeField.becomeFirstResponder()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public override func becomeFirstResponder() -> Bool {
        return passcodeField.becomeFirstResponder()
    }
    
    public override func resignFirstResponder() -> Bool {
        return passcodeField.resignFirstResponder()
    }
    
}

// MARK: - Public methods
extension UXPasscodeViewController {
    
    public class func instantiate(message:String? = nil) -> UXPasscodeViewController {
        
        let bundle = Bundle(for:self)
        
        guard let resourceBundleURL = bundle.url(forResource: "UXPasscodeField", withExtension: "bundle") else {
            fatalError("Couldn't instantiate UXPasscodeViewController")
        }
        
        guard let resourceBundle = Bundle(url: resourceBundleURL) else {
            fatalError("Couldn't instantiate UXPasscodeViewController")
        }
        
        let storyboard = UIStoryboard(name: "UXPasscodeViewController", bundle: resourceBundle)
        guard let viewController = storyboard.instantiateInitialViewController() as? UXPasscodeViewController else {
            fatalError("Couldn't instantiate UXPasscodeViewController")
        }
        
        viewController.message = message
        return viewController
    }
    
    public func done(action: @escaping (_ passcode:String)->Void) {
        doneAction = action
    }
    
}

// MARK: - Private methods
extension UXPasscodeViewController {
    
    @IBAction fileprivate func passcodeFieldValueDidChange() {
        
        if passcodeField.passcode.characters.count == passcodeField.numberOfDigits {
            doneAction?(passcodeField.passcode)
        }
        
    }
    
}
