//
//  OccupationSearch.swift
//  Canvas
//
//  Created by urmila reddy on 02/12/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation
struct OccupationSearch {
  let name: String?
  let value: String?
 
  static func getOccupations(_ json: [[String:Any]]) -> [OccupationSearch] {
    var occupationList: [OccupationSearch] = []
   occupationList =  json.map{ occupationJson in
  
      return OccupationSearch(name: occupationJson["name"] as? String,
                     value: occupationJson["value"] as? String)
    }
    return occupationList
  }
}
