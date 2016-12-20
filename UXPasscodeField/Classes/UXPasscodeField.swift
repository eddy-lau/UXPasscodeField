//
//  UXPasscodeField.swift
//  Pods
//
//  Created by Eddie Hiu-Fung Lau on 19/12/2016.
//
//

import UIKit

public class UXPasscodeField: UIControl, UIKeyInput {

    // MARK: - Public variables
    public var numberOfDigits = 6 {
        didSet {
            
            if oldValue != numberOfDigits {
                passcode = ""
                relayout()
                redisplay()
            }
            
        }
    }
    
    public var passcode: String = "" {
        didSet {
            
            if oldValue != passcode {
                
                guard passcode.characters.count <= numberOfDigits else {
                    return
                }
                
                guard isNumeric(passcode) else {
                    return
                }
                
                redisplay()
                sendActions(for: .valueChanged)
                
            }
        }
    }
    
    public var spaceBetweenDigits = CGFloat(10.0) {
        
        didSet {
            
            if oldValue != spaceBetweenDigits {
            
                relayout()
                redisplay()
                
            }
        }
        
    }
    
    public var dashColor = UIColor.gray {
        didSet {
            
            if oldValue != dashColor {
                redisplay()
            }
            
        }
    }
    
    public var textColor = UIColor.black {
        didSet {
            if oldValue != textColor {
                redisplay()
            }
        }
    }
    
    // MARK: - Private variables
    private var numberLabels: [UILabel] = []
    private let emptyDigit = "–"
    
    
    // MARK: - UIView
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override public func layoutSubviews() {
        
        for index in 0..<numberLabels.count {
            let label = numberLabels[index]
            let frame = frameOfNumberLabel(ofDigitIndex: index)
            label.font = UIFont.systemFont(ofSize: frame.size.width * 0.9)
            label.frame = frame
        }
        
    }
    

    // MARK: - Private methods
    private func setup() {

        addTarget(self, action: #selector(UXPasscodeField.didTouchUpInside), for: .touchUpInside)
        relayout()
        
    }
    
    private func relayout() {
        numberLabels.forEach { label in
            label.removeFromSuperview()
        }
        numberLabels = []
        
        for i in 0..<numberOfDigits {
            let numberLabel = UILabel()
            numberLabel.text = emptyDigit
            numberLabel.textColor = dashColor
            numberLabel.textAlignment = .center
            numberLabels.append(numberLabel)
            addSubview(numberLabel)
        }
        
        setNeedsLayout()
        
    }
    
    
    private func frameOfNumberLabel(ofDigitIndex index:Int) -> CGRect {
        
        let w = (bounds.size.width - spaceBetweenDigits * (CGFloat(numberOfDigits) - 1.0)) / CGFloat(numberOfDigits)
        let h = bounds.size.height
        let x = (w + spaceBetweenDigits) * CGFloat(index)
        let y = CGFloat(0)
        return CGRect(x:x, y:y, width:w, height:h)
        
    }
    
    private func redisplay() {
        
        for i in 0..<numberOfDigits {
            
            let label = numberLabels[i]
            
            if i < passcode.characters.count {

                let start = passcode.index(passcode.startIndex, offsetBy: i)
                let end = passcode.index(start, offsetBy: 1)
                let number = passcode.substring(with:start..<end)
                label.text = number
                label.textColor = textColor
                
            } else {
                
                label.text = emptyDigit
                label.textColor = dashColor
            }
        }
        
    }
    
    private func isNumeric(_ string:String) -> Bool {
        
        guard let regex = try? NSRegularExpression(pattern: "^[0-9]*$", options: []) else {
            return false
        }
        
        return regex.numberOfMatches(in: string, options: [], range: NSMakeRange(0, string.characters.count)) == 1
    }
    
    // MARK: - Handle the touch up event
    @objc private func didTouchUpInside() {
        becomeFirstResponder()
    }

    // MARK: UIKeyInput protocol
    public var hasText: Bool {
        return !passcode.isEmpty
    }
    
    public func insertText(_ text: String) {
        
        guard passcode.characters.count + text.characters.count <= numberOfDigits else {
            return
        }
        
        guard isNumeric(text) else {
            return
        }
        
        passcode = passcode + text
    }
    
    public func deleteBackward() {
        guard passcode.characters.count > 0 else {
            return
        }
        passcode = passcode.substring(to: passcode.index(before: passcode.endIndex))
    }
    
    // MARK: UIResponder
    public override var canBecomeFirstResponder: Bool {
        return true
    }
    
    // MARK: UIKeyboardTrait
    
    public  var keyboardType: UIKeyboardType {
        return .numberPad
    }
    

}
