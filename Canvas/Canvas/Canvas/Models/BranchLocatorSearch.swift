//
//  BranchLocatorSearch.swift
//  Canvas
//
//  Created by urmila reddy on 08/12/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation
import Foundation
struct BranchLocatorSearch {
  let branchAddress: String?
  let branchName: String?
    let latitude: String?
    let longitude: String?
    let phone: String?
   
 
  static func getBranches(_ json: [[String:Any]]) -> [BranchLocatorSearch] {
    var branchLocatorList: [BranchLocatorSearch] = []
   branchLocatorList =  json.map{ branchLocatorJson in
  
      return BranchLocatorSearch(branchAddress: branchLocatorJson["branchAddress"] as? String,
                     branchName: branchLocatorJson["branchName"] as? String,latitude: branchLocatorJson["latitude"] as? String,
                     longitude: branchLocatorJson["longitude"] as? String,phone: branchLocatorJson["phone"] as? String)
    }
    return branchLocatorList
  }
}
