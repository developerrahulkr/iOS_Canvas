//
//  SecurityQuestion.swift
//  Canvas
//
//  Created by Varun Peddi on 30/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation
class SecurityQuestion {
  var languageCode: String?
  var question: String? = "Select your question?"
  var questionId: Int?
  var serialNumber: Int?
  var isextraQuestionEnabled = false
  var answer: String? = nil
  
  init() {
    
  }
  init(languageCode: String?,question:String?,questionId: Int?,serialNumber: Int?) {
    self.languageCode = languageCode
    self.questionId = questionId
    self.question = question
    self.serialNumber = serialNumber

  }
  
  static func getSecurityQuestion(_ json: [[String:Any]]) -> [SecurityQuestion] {
    var securityQuestions: [SecurityQuestion] = []
    securityQuestions =  json.map{ questionJSon in
      print(questionJSon)
  
      return SecurityQuestion(languageCode: questionJSon["languageCode"] as? String,
                              question: questionJSon["question"] as? String,
                              questionId: questionJSon["questionId"] as? Int,
                              serialNumber: questionJSon["serialNumber"] as? Int)
    }
    return securityQuestions
  }
  
}
