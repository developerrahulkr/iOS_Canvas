//
//  Country.swift
//  Canvas
//
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit


struct Country {
    let countryCode: String?
    let currencyCode: String?
    let countryName: String?
    let currencyFulName: String?
    let phoneCode: String?
    let denomination : Int?
    static func getCountries(_ json: [[String:Any]]) -> [Country] {
        var countriesList: [Country] = []
        countriesList =  json.map{ countryJSon in
            print(countryJSon)
            return Country(countryCode: countryJSon["countryCode"] as? String,
                           currencyCode: countryJSon["countryCurrency"] as? String,
                           countryName: countryJSon["countryName"] as? String,
                           currencyFulName: countryJSon["currencyName"] as? String,
                           phoneCode: countryJSon["phoneCode"] as? String,
                           denomination: countryJSon["denomination"] as? Int)
        }
        return countriesList
    }
}
