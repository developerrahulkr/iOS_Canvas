//
//  BeneficiaryPurposeData.swift
//  Canvas
//
//  Created by Varun Peddi on 08/12/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation

struct BeneficiaryPurposeData {
  let name: String?
  let value: String?
  static func getPickerData(_ json: [[String: Any]]) -> [BeneficiaryPurposeData] {
    var data: [BeneficiaryPurposeData] = []
    data =  json.map{ purposeJson in
         return BeneficiaryPurposeData(name: purposeJson["name"] as? String,
                        value: purposeJson["value"] as? String)
       }
    return data
  }
}
