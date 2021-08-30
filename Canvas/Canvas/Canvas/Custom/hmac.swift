//
//  hmac.swift
//  Canvas
//
//  Created by urmila reddy on 17/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation
import CommonCrypto

enum HMACAlgorithm {
case MD5, SHA1, SHA224, SHA256, SHA384, SHA512

func toCCHmacAlgorithm() -> CCHmacAlgorithm {
    var result: Int = 0
    switch self {
    case .MD5:
        result = kCCHmacAlgMD5
    case .SHA1:
        result = kCCHmacAlgSHA1
    case .SHA224:
        result = kCCHmacAlgSHA224
    case .SHA256:
        result = kCCHmacAlgSHA256
    case .SHA384:
        result = kCCHmacAlgSHA384
    case .SHA512:
        result = kCCHmacAlgSHA512
    }
    return CCHmacAlgorithm(result)
}
func digestLength() -> Int {
        var result: CInt = 0
        switch self {
        case .MD5:
            result = CC_MD5_DIGEST_LENGTH
        case .SHA1:
            result = CC_SHA1_DIGEST_LENGTH
        case .SHA224:
            result = CC_SHA224_DIGEST_LENGTH
        case .SHA256:
            result = CC_SHA256_DIGEST_LENGTH
        case .SHA384:
            result = CC_SHA384_DIGEST_LENGTH
        case .SHA512:
            result = CC_SHA512_DIGEST_LENGTH
        }
        return Int(result)
    }
}
extension String {
    func hmac(algorithm: HMACAlgorithm, key: String) -> String {
        let cKey = key.cString(using: String.Encoding.utf8)
        let cData = self.cString(using: String.Encoding.utf8)
        var result = [CUnsignedChar](repeating: 0, count: Int(algorithm.digestLength()))
        //to resolve strlen
      //  CCHmac(algorithm.toCCHmacAlgorithm(), cKey!, Int(strlen(cKey!)), cData!, Int(strlen(cData!)), &result)
        CCHmac(algorithm.toCCHmacAlgorithm(), cKey!, Int(cKey!.count - 1), cData!, Int(cData!.count - 1), &result)
        let hmacData:NSData = NSData(bytes: result, length: (Int(algorithm.digestLength())))
        
     //   let hmacBase64 = hmacData.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength76Characters)
       // return String(hmacBase64)
        
        var bytes = [UInt8](repeating: 0, count: hmacData.length)
        hmacData.getBytes(&bytes, length: hmacData.length)

        var hexString = ""
        for byte in bytes {
            hexString += String(format:"%02hhx", UInt8(byte))
        }
        return hexString
    }
}

