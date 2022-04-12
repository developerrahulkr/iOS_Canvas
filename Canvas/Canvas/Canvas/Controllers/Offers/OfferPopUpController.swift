//
//  OfferPopUpController.swift
//  Canvas
//
//  Created by RAC on 27/08/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire
class OfferPopUpController: UIViewController {

    @IBOutlet weak var viewOffer: UIView!
    @IBOutlet weak var btn_close: UIButton!
    @IBOutlet weak var img_offer: UIImageView!
    var imgUrl = ""
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewOffer.isHidden = true
        DispatchQueue.main.async {
            self.getOfferList()
        }
       // getOfferList()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        img_offer.isUserInteractionEnabled = true
        img_offer.addGestureRecognizer(tapGestureRecognizer)
        
     
        
       
    }
    override func viewWillDisappear(_ animated: Bool) {
        Global.shared.checkOfferPopUp = 1
    }
    override func viewDidLayoutSubviews() {
        //btn_close.layer.cornerRadius = btn_close.frame.size./2
       // self.btn_close.layer.masksToBounds = true
        print("Hello abc",btn_close.frame.size.width,btn_close.frame.size.height)
        btn_close.layer.cornerRadius = btn_close.frame.size.width/2
        btn_close.layer.masksToBounds = true
    }
    @objc func updateTime() {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        //let tappedImage = tapGestureRecognizer.view as! UIImageView
        if imgUrl != "null" && imgUrl != ""
        {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OfferWebController") as! OfferWebController
        vc.str_url = imgUrl
        self.navigationController?.pushViewController(vc, animated: true)
        print(imgUrl)
        }

        // Your action
    }
    @IBAction func onClickCloseOffer(_ sender: Any) {
        self.view.isHidden = true
      //  self.view.removeAllSubviews()
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    func getOfferList() {
        let paramaterPasing: [String:Any] = ["offerType":2,"DeviceType":3,"language":LocalizationSystem.sharedInstance.getLanguage(),"RegistrationId":Global.shared.afterLoginRegistrtnId ?? ""]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        NetWorkDataManager.sharedInstance.postLoginOffer(headersTobePassed: headers, postParameters: paramaterPasing) { [self] resonseTal , errorString in
            
            if errorString == nil
            {
              // print(resonseTal)
               
              
                if let offer = resonseTal?.value(forKey: "image") as? String
                {
                    
                    let image1 = offer.base64ToImage()
                    if image1 != nil
                    {
                        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations:{

                            self.viewOffer.isHidden = false

                        })
                        print(image1!)
                        self.img_offer.image = image1
                    }
                    else
                    {
                        self.dismiss(animated: true, completion: nil)
                    }
                    
                }
                else
                {
                    self.dismiss(animated: true, completion: nil)
                }
                
                
                if let url = resonseTal?.value(forKey: "externalUrl") as? String
                {
                    self.imgUrl = url
                }
                timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            }
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                   let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}

