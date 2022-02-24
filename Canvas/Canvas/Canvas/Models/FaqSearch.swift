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
struct HelpSearch {
  let title: String?
  let content: String?
  let thumbNailURL: String?
  let videoURL: String?
   
//    let fileName : String?
//    let helpTypes : Int?
//    let id : Int?
//    let language: String?
   
    
    
 
  static func getHelps(_ json: [[String:Any]]) -> [HelpSearch] {
    var helpList: [HelpSearch] = []
    helpList =  json.map{ faqJson in
  
      return HelpSearch(title: faqJson["title"] as? String,
                       content: faqJson["content"] as? String,thumbNailURL: faqJson["thumbNailURL"] as? String,
                        videoURL:faqJson["videoURL"] as? String)
    }
    return helpList
  }
}
