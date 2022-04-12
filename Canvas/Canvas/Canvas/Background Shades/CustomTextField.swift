//
//  CustomTextField.swift
//  Canvas
//
//  Created by urmila reddy on 03/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation
import UIKit

enum ValueType: Int {
    case none
    case alphabet
    case numbers
    case numbers_with_splchar   // Allowed "+0123456789"
    case alphanumeric
    case alphabet_with_space       // Allowed letters and space
    case alphanumeric_with_space
    case numbers_with_space
    case any
    case password_Validation
}
public extension UITextField
{
    // ⚠️ Prefer english keyboards
    
    //
    override var textInputMode: UITextInputMode?
    {
        let locale = Locale(identifier: "en_US") // your preferred locale

        return
            UITextInputMode.activeInputModes.first(where: { $0.primaryLanguage == locale.languageCode })
            ??
            super.textInputMode
    }
}
class CustomTextField: UITextField {
    
    
     
    @IBInspectable var maximLength: Int = 0 // Max character length
    var valueType: ValueType = ValueType.none // Allowed characters
    
    /************* Added new feature ***********************/
    // Accept only given character in string, this is case sensitive
    @IBInspectable var allowedCharInString: String = ""
    
    func verifyFields(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch valueType {
        case .none:
        break // Do nothing
        case .any:
            break
        case .alphabet:
                let characterSet = CharacterSet.letters
                if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                    return false
                }
                
            case .numbers:
                let numberSet = CharacterSet.decimalDigits
                if string.rangeOfCharacter(from: numberSet.inverted) != nil {
                    return false
                }
                
            case .numbers_with_splchar:
             /*   let phoneNumberSet = CharacterSet(charactersIn: ".-!@#$%&*ˆ+=_0123456789")
                if string.rangeOfCharacter(from: phoneNumberSet.inverted) != nil {
                    return false*/
           var characterSet = CharacterSet(charactersIn: ".").union(CharacterSet.decimalDigits)
             characterSet = CharacterSet(charactersIn: string)
            if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                return false
            
                }
        case .password_Validation:
         let characterSet = CharacterSet(charactersIn: "ABCDEFGHIJKLKMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()")
              //  print(characterSet)
             /*   characterSet = characterSet.union(CharacterSet(charactersIn: "^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?])(?=\\S+$).{8,}$"))*/
                if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                    return false
                }
                
            case .alphanumeric:
                let alphaNumericSet = CharacterSet.alphanumerics
                if string.rangeOfCharacter(from: alphaNumericSet.inverted) != nil {
                    return false
                }
                
            case .alphabet_with_space:
                var characterSet = CharacterSet.letters
                print(characterSet)
                characterSet = characterSet.union(CharacterSet(charactersIn: " "))
                if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                    return false
                }
           case .alphanumeric_with_space:
            var characterSet = CharacterSet.alphanumerics
            print(characterSet)
            characterSet = characterSet.union(CharacterSet(charactersIn: " "))
            if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                return false
            }
            
           case .numbers_with_space:
            var characterSet = CharacterSet.decimalDigits
                   print(characterSet)
                   characterSet = characterSet.union(CharacterSet(charactersIn: " "))
                   if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                       return false
                   }
          
        
            
        
        if let text = self.text, let textRange = Range(range, in: text) {
            let finalText = text.replacingCharacters(in: textRange, with: string)
            if maximLength > 0, maximLength < finalText.utf8.count {
                return false
            }
        }
        
        // Check supported custom characters
        if !self.allowedCharInString.isEmpty {
            let customSet = CharacterSet(charactersIn: self.allowedCharInString)
            if string.rangeOfCharacter(from: customSet.inverted) != nil {
                return false
            }
        }
        
    }
         return true
    }
//    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
//        if action == #selector(UIResponderStandardEditActions.paste(_:)) ||  action == #selector(UIResponderStandardEditActions.copy(_:)) || action == #selector(UIResponderStandardEditActions.cut(_:)) {
//                print("abc")
//                return false
//            }
//            return super.canPerformAction(action, withSender: sender)
//       }
}



