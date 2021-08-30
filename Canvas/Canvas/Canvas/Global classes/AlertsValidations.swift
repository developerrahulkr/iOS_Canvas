//
//  AlertsValidations.swift


import Foundation
import UIKit

class AlertsValidations {
    
    static let SharedInstanceOfSingleTon = AlertsValidations()
    
    private  init() {
        
    }
    
    
    
    //MARK:- OPEN URL
    
    func openUrl(urlString :String)
    {
        if let url = URL(string: urlString) {
            
            UIApplication.shared.open(url, options: [:])
        }
    }
    
   
    func validateMobileNumber(value: String) -> Bool {
        // let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let PHONE_REGEX = "([+]?1+[-]?)?+([(]?+([0-9]{3})?+[)]?)?+[-]?+[0-9]{3}+[-]?+[0-9]{4}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    func validateEmail(emailid: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: emailid)
    }
    
    func validatePassword(value: String) -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: value)
    }
    
    //MARK:- POP UP RELATED ANIMATIONS
    func showAnimate(view:UIView)
    {
        view.transform=CGAffineTransform(scaleX: 1.3, y: 1.3)
        
        view.alpha=0.0;
        
        UIView.animate(withDuration: 0.40, animations:{
            
            view.alpha=1.0;
            
            view.transform=CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
        
    }
    
    func removeAnimate(view:UIView)
    {
        UIView.animate(withDuration: 0.40, animations:{
            
            view.transform=CGAffineTransform(scaleX: 1.3, y: 1.3)
            
            view.alpha=0.0;
        },completion:{(finished : Bool)in
            
            if(finished)
            {
                view.removeFromSuperview()
            }});
    }
    
    func genericAlert(withMessage message:String, andTitle title:String = "Error")
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(defaultAction)
        UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alertController, animated: true, completion: nil)
    }
    
   
   
    func convertTimeStapToCureentTime(timeStamp : Double) -> String {
        
        let date = NSDate(timeIntervalSince1970: TimeInterval(timeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.full //Set date style
        dateFormatter.timeZone = TimeZone.current
        let localDate = dateFormatter.string(from: date as Date)
        return localDate
    }
    
   
    
    func dateStringToUnixTimeStampConvertion(dateString : String) ->Double{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy" //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        let date = dateFormatter.date(from: dateString) //according to date format your date string
        let unix = date?.timeIntervalSince1970
        return unix!
    }
    
    
    func EventsTimeStringToUnixTimeStampConvertion(dateString : String) ->Double{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy h:mm a" //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        let date = dateFormatter.date(from: dateString) //according to date format your date string
        let unix = date?.timeIntervalSince1970
        return unix!
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func saveImage(image: UIImage) -> String? {
        let fileName = "FileName"
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            try? imageData.write(to: fileURL, options: .atomic)
            return fileName // ----> Save fileName
        }
        print("Error saving image")
        return nil
    }
    
    func loadImage(fileName: String) -> UIImage? {
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }
    
}

