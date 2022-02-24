//
//  main.swift
//  Canvas
//
//  Created by urmila reddy on 12/02/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import Foundation
import UIKit
import IOSSecuritySuite

UIApplicationMain(
  
    CommandLine.argc,
    UnsafeMutableRawPointer(CommandLine.unsafeArgv)
        .bindMemory(
            to: UnsafeMutablePointer<Int8>.self,
            capacity: Int(CommandLine.argc)),
    NSStringFromClass(TimerApplication.self),
    NSStringFromClass(AppDelegate.self)
    
   
)
