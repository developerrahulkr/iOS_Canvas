//
//  Reachability.swift
//  Canvas
//
//  Created by urmila reddy on 09/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
  static let sharedInstance = NetworkReachabilityManager()!
  static var isConnectedToInternet:Bool {
      return self.sharedInstance.isReachable
    }
}
