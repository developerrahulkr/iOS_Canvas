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
     var addressId : String?
     var firstName : String?
     var flat : String?
     var floor : String?
     var building : String?
     var gada : String?
     var street : String?
     var block : String?
     var areaCity : String?
     var postalCode : String?
     var phoneNumber : String?
     var createdDate : String?
     var updatedDate : String?
     var registrationId : String?
     var bIsDefault : String?
     var latitude : String?
     var longitude : String?
}


struct CMBookingBranchAddress : Codable{
     var id : Int?
     var branchCode : String?
     var branchName : String?
     var branchAddress : String?
     var phone : String?
     var fax : String?
     var latitude : String?
     var longitude : String?
     var languageCode : String?
     var isFEEnabled : Bool?
}


struct CMSelectDate : Codable {
    var id, sDate : String?
}

struct FXTimeSlot : Codable {
    var name, value : String?
}

