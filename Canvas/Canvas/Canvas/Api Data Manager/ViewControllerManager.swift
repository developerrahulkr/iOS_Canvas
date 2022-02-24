//
//  ViewControllerManager.swift


import Foundation
import UIKit

class ViewControllerManager: NSObject
{
   
    //Display alert message Method
    class func displayAlert(message:String, title:String) -> UIAlertController
    {
       
        if Global.shared.okTxt == "" || Global.shared.okTxt == nil
        {
            let alert = UIAlertController(title: title, message: message,preferredStyle: .alert)
            alert.view.tintColor = ColorCodes.newAppRed
            alert.addAction(UIAlertAction(title: "OK", style: .default,handler:nil))
            return alert
        }
        else{
            let alert = UIAlertController(title: title, message: message,preferredStyle: .alert)
            alert.view.tintColor = ColorCodes.newAppRed
            alert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default,handler:nil))
            return alert
        }
    }
}
