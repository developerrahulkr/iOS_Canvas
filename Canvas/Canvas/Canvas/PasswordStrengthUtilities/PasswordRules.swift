//
//  PasswordRules.swift
//  Password Strength
//
//  Created by MacBook Pro on 11/9/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation

public class PasswordRules {
    public static var passwordRule : [ValidationRequiredRule] = [.lowerCase , .digit, .oneUniqueCharacter, .minmumLength, .uppercase]
    
    public static var weakStrengthColor : String = "ec0500"
    public static var mediumStrengthColor : String = "ffb000"
    public static var strongStrengthColor : String = "9ac251"
    public static var veryStrongStrengthColor : String = "00b700"
    
    public static var isUniqueCharRequired: Bool =  true
    public static var minPasswordLength : Int = 8
    public static var maxPasswordLength : Int = 20
}
