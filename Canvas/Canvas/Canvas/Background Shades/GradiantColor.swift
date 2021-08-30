//
//  GradiantColor.swift
//  Canvas
//
//  Created by urmila reddy on 08/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
///

import Foundation
import UIKit
extension CAGradientLayer {
    func backgroundGradientTopBottom() -> CAGradientLayer {
      let topColor = UIColor(red: (252/255.0), green: (176/255.0), blue:(64/255.0), alpha: 1)
      //  let topColor = ColorCodes.GREEN
       // let bottomColor = UIColor(red: (245/255.0), green: (238/255.0), blue:(48/255.0), alpha: 1)
        let bottomColor = UIColor.white
//        let leftColor = ColorCode.PURPLE
//        let rightColor = ColorCode.PURPLE
//        let gradientColors: [CGColor] = [topColor.cgColor, leftColor.cgColor,bottomColor.cgColor,rightColor.cgColor]
//        let gradientLocations: [Float] = [0.0, 0.1, 0.9, 1.0]
        let gradientColors: [CGColor] = [topColor.cgColor,bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0,1.0]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)

        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)

        gradientLayer.locations = gradientLocations as [NSNumber]
      
        return gradientLayer
        
}
    func backgroundGradientLeftRight() -> CAGradientLayer {
        
        let leftColor = ColorCodes.RED
        
        let rightColor = ColorCodes.LIGHTORANGE
       
        let gradientColors: [CGColor] = [leftColor.cgColor,rightColor.cgColor]
       // let gradientLocations: [Float] = [0.0,1.0]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
       // gradientLayer.locations = gradientLocations as [NSNumber]
        
        return gradientLayer
        
    }
   
    func backgroundGradientForFirstFamily() -> CAGradientLayer {
        let topColor = UIColor(red: (238/255.0), green: (239/255.0), blue:(243/255.0), alpha: 1)
        // let topColor = ColorCode.LIGHTORANGE
        // let bottomColor = UIColor(red: (245/255.0), green: (238/255.0), blue:(48/255.0), alpha: 1)
        let bottomColor = UIColor.white
        //        let leftColor = ColorCode.PURPLE
        //        let rightColor = ColorCode.PURPLE
        //        let gradientColors: [CGColor] = [topColor.cgColor, leftColor.cgColor,bottomColor.cgColor,rightColor.cgColor]
        //        let gradientLocations: [Float] = [0.0, 0.1, 0.9, 1.0]
        let gradientColors: [CGColor] = [topColor.cgColor,bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0,1.0]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        gradientLayer.locations = gradientLocations as [NSNumber]
   
        return gradientLayer
        
    }
  
   
}
