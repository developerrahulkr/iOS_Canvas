//
//  VerifyAcountFourthVc.swift
//  Canvas
//
//  Created by urmila reddy on 06/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import  Alamofire

class VerifyAcountFourthVc: UIViewController {
    
    @IBOutlet weak var showMoreBtnOtlt: UIButton!
       
       @IBOutlet weak var showLessBtnOtlt: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var bckgrndImg: UIImageView!
    
    
    @IBOutlet weak var allImagesViewHeightConstrt: NSLayoutConstraint!
    
    
    @IBOutlet weak var secndStactView: UIStackView!
    
    @IBOutlet weak var tabLblFour: UILabel!
    
    @IBOutlet weak var addSecureImgLbl: UILabel!
    
    
    
    @IBOutlet weak var submitBtnOtlt: UIButton!
    
    @IBOutlet weak var backBtnOtlt: UIButton!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var firstBtnImgOtlt: UIButton!
    
    @IBOutlet weak var secndBtnImgOtlt: UIButton!
    
    @IBOutlet weak var thirBtnImgOtlt: UIButton!
    
    
    @IBOutlet weak var fourthBtnImgOtlt: UIButton!
    
    @IBOutlet weak var fifthBtnImgOtlt: UIButton!
    
    @IBOutlet weak var sixthBtnImgOtlt: UIButton!
    
    var imageData = [String]()
    
    
    //250
    //160
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ExistingUser.shared.imgSelected = nil
        
        self.showSpinner(onView: self.view)
        
        submitBtnOtlt.layer.cornerRadius = 5
        backBtnOtlt.layer.cornerRadius = 5
        firstView.layer.cornerRadius = 5
        
        
        self.scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        //  self.scrollView.addSubview()
        self.topView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        
        // Do any additional setup after loading the view.
        self.tabLblFour.layer.cornerRadius = self.tabLblFour.frame.size.width / 2;
        self.tabLblFour.clipsToBounds = true
        downloadAccountConfig()
        assignLabels()
    }
    
    func assignLabels() {
        showMoreBtnOtlt.setTitle(Global.shared.showMoreTxt, for: .normal)
         showLessBtnOtlt.setTitle(Global.shared.showLessTxt, for: .normal)
        
        addSecureImgLbl.text = Global.shared.selectSecureImgTxt
        submitBtnOtlt.setTitle(Global.shared.submitBtnTxt, for: .normal)
        backBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    @IBAction func showMoreBtnActn(_ sender: Any) {
        self.showMoreBtnOtlt.isHidden = true
        self.secndStactView.isHidden = false
        self.showLessBtnOtlt.isHidden = false
        self.allImagesViewHeightConstrt.constant = 250
        
    }
    
    @IBAction func showLessBtnActn(_ sender: Any) {
        self.showMoreBtnOtlt.isHidden = false
        self.secndStactView.isHidden = true
        self.showLessBtnOtlt.isHidden = true
        self.allImagesViewHeightConstrt.constant = 160
    }
    
    
    
    @IBAction func submitBtnActn(_ sender: Any) {
        
        
      //  if  Global.shared.fromNewExistUser == "Exist User" {
            if ExistingUser.shared.imgSelected != nil {
              let verifyOnlineAcntVc: VerifyOnlineAcntVc = .initiateController()
              self.pushViewController(controller: verifyOnlineAcntVc)
            }
            else {
                let alert = ViewControllerManager.displayAlert(message:Global.shared.selectSecurityImg, title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
            
     //   }
      /*  else {
              let vc = self.storyboard?.instantiateViewController(identifier: "VerifyOnlineAcntVc") as! VerifyOnlineAcntVc
             self.navigationController?.pushViewController(vc, animated: true)
            
          //  generateOTP()
        }*/
        
    }
    
    
    
    // MARK: From configurations getting security images
    func downloadAccountConfig() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.accountConfigsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
                
                print(resonseTal!)
                if let securityQuestion = resonseTal?.value(forKey: "masterSecurityImages") as? NSArray {
                    print(securityQuestion)
                    if let imgData = securityQuestion.value(forKey: "imageData") as? [String] {
                        print(imgData)
                        self.imageData = imgData
                    }
                    print(self.imageData)
                    
                    
                }
                
                
                let image1 = self.imageData[0].base64ToImage()
                self.firstBtnImgOtlt.setImage(image1, for: .normal)
                
                let image2 = self.imageData[1].base64ToImage()
                self.secndBtnImgOtlt.setImage(image2, for: .normal)
                
                let image3 = self.imageData[2].base64ToImage()
                self.thirBtnImgOtlt.setImage(image3, for: .normal)
                
                let image4 = self.imageData[3].base64ToImage()
                self.fourthBtnImgOtlt.setImage(image4, for: .normal)
                
                let image5 = self.imageData[4].base64ToImage()
                self.fifthBtnImgOtlt.setImage(image5, for: .normal)
                
                let image6 = self.imageData[5].base64ToImage()
                self.sixthBtnImgOtlt.setImage(image6, for: .normal)
                
            }
                
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    
    
    @IBAction func backBtnActn(_ sender: Any) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.popViewController(animated: false)
    }
    
    
    
    
    @IBAction func firstBtnActn(_ sender: Any) {
        ExistingUser.shared.imgSelected = imageData[0]
        firstBtnImgOtlt.borderColor = .red
        firstBtnImgOtlt.borderWidth = 1.0
        
        secndBtnImgOtlt.borderColor = .clear
        thirBtnImgOtlt.borderColor = .clear
        fourthBtnImgOtlt.borderColor = .clear
        fifthBtnImgOtlt.borderColor = .clear
        sixthBtnImgOtlt.borderColor = .clear
    }
    
    
    @IBAction func secndBtnActn(_ sender: Any) {
        
        ExistingUser.shared.imgSelected = imageData[1]
        
        secndBtnImgOtlt.borderColor = .red
        secndBtnImgOtlt.borderWidth = 1.0
        
        firstBtnImgOtlt.borderColor = .clear
        thirBtnImgOtlt.borderColor = .clear
        fourthBtnImgOtlt.borderColor = .clear
        fifthBtnImgOtlt.borderColor = .clear
        sixthBtnImgOtlt.borderColor = .clear
        
    }
    
    
    @IBAction func thirdBtnActn(_ sender: Any) {
        ExistingUser.shared.imgSelected = imageData[2]
        
        thirBtnImgOtlt.borderColor = .red
        thirBtnImgOtlt.borderWidth = 1.0
        
        firstBtnImgOtlt.borderColor = .clear
        secndBtnImgOtlt.borderColor = .clear
        fourthBtnImgOtlt.borderColor = .clear
        fifthBtnImgOtlt.borderColor = .clear
        sixthBtnImgOtlt.borderColor = .clear
    }
    
    
    @IBAction func fourthBtnActn(_ sender: Any) {
        ExistingUser.shared.imgSelected = imageData[3]
        
        fourthBtnImgOtlt.borderColor = .red
        fourthBtnImgOtlt.borderWidth = 1.0
        
        firstBtnImgOtlt.borderColor = .clear
        secndBtnImgOtlt.borderColor = .clear
        thirBtnImgOtlt.borderColor = .clear
        fifthBtnImgOtlt.borderColor = .clear
        sixthBtnImgOtlt.borderColor = .clear
    }
    
    @IBAction func fifthBtnActn(_ sender: Any) {
        ExistingUser.shared.imgSelected = imageData[4]
        
        fifthBtnImgOtlt.borderColor = .red
        fifthBtnImgOtlt.borderWidth = 1.0
        
        firstBtnImgOtlt.borderColor = .clear
        secndBtnImgOtlt.borderColor = .clear
        thirBtnImgOtlt.borderColor = .clear
        fourthBtnImgOtlt.borderColor = .clear
        sixthBtnImgOtlt.borderColor = .clear
    }
    
    
    @IBAction func sixthBtnActn(_ sender: Any) {
        ExistingUser.shared.imgSelected = imageData[5]
        
        sixthBtnImgOtlt.borderColor = .red
        sixthBtnImgOtlt.borderWidth = 1.0
        
        firstBtnImgOtlt.borderColor = .clear
        secndBtnImgOtlt.borderColor = .clear
        thirBtnImgOtlt.borderColor = .clear
        fourthBtnImgOtlt.borderColor = .clear
        fifthBtnImgOtlt.borderColor = .clear
    }
    
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
}
