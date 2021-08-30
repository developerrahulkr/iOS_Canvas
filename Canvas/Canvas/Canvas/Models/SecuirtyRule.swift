//
//  SecuirtyRule.swift
//  Canvas
//
//  Created by Varun Peddi on 30/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation

struct SecurityRule: Codable {
  let signup_questions_answered_limit: String?
  let login_questions_worng_trails: String?
  let login_questions_display_limit: String?
}
