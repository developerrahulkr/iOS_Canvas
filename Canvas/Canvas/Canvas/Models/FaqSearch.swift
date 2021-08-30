//
//  FaqSearch.swift
//  Canvas
//
//  Created by urmila reddy on 08/12/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation
struct FaqSearch {
  let question: String?
  let answer: String?
    let serialNumber: Int?
 
  static func getFaqs(_ json: [[String:Any]]) -> [FaqSearch] {
    var faqList: [FaqSearch] = []
   faqList =  json.map{ faqJson in
  
      return FaqSearch(question: faqJson["question"] as? String,
                       answer: faqJson["answer"] as? String, serialNumber: faqJson["serialNumber"] as? Int)
    }
    return faqList
  }
}
