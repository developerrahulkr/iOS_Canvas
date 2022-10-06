//
//  CMFXBooking.swift
//  Canvas
//
//  Created by Akshay_mac on 28/09/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import Foundation

struct CMFXBooking {
     
    var actualRate,amountFrom,netAmt,rate : String
    var amountTo,commAmount,promoCommAmount,currenyCodeFrom,currenyCodeTo,countryCode : String
//    var getPromoListResult
//    currenyCodeFrom
//    currenyCodeTo = INR;

//    let type, fcAmount, lcAmount, currencyCode, countryCode, finalText : String?
}

struct CMBookingHomeAddress : Codable{
     var addressId : Int?
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
     var bIsDefault : Bool?
     var latitude : String?
     var longitude : String?
     var isselected : Bool = false
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

struct Welcome: Codable {
    var status: Bool?
    var statusCodes: Int?
    var statusMessage, messageCode: String?
    var getPromoListResult: [GetPromoListResult]?
}

// MARK: - GetPromoListResult
struct GetPromoListResult: Codable {
    var headerText, contentText, promoImage, promoCode: String?
//    let defaultFlag: JSONNull?
}
