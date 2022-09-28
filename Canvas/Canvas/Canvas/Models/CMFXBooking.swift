//
//  CMFXBooking.swift
//  Canvas
//
//  Created by Akshay_mac on 28/09/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import Foundation

struct CMFXBooking {
    let type, fcAmount, lcAmount, currencyCode, countryCode, finalText : String?
}

struct CMBookingHomeAddress : Codable{
    let addressId : String
    let firstName : String
    let flat : String
    let floor : String
    let building : String
    let gada : String
    let street : String
    let block : String
    let areaCity : String
    let postalCode : String
    let phoneNumber : String
    let createdDate : String
    let updatedDate : String
    let registrationId : String
    let bIsDefault : String
    let latitude : String
    let longitude : String
}
