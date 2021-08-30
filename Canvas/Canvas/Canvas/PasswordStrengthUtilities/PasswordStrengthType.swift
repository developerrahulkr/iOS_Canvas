//
//  PasswordStrengthType.swift
//  Password Strength
//
//  Created by MacBook Pro on 11/9/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation


enum StrengthType {
  case weak
  case medium
  case strong
  case veryStrong
  var getStregth: String {
    switch self {
    case .strong:
    //  return "High"
        return Global.shared.highTxt
    case .medium:
     // return "Medium"
        return Global.shared.mediumTxt
    case .veryStrong:
    //  return "Strong"
        return Global.shared.strongTxt
    case .weak:
     // return "Low"
        return Global.shared.lowTxt
      
    }
  }
}

public enum ValidationRequiredRule {
  case lowerCase
  case uppercase
  case digit
 // case specialCharacter
  case oneUniqueCharacter
  case minmumLength
}
