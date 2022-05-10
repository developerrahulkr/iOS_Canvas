//
//  ChatController.swift
//  Canvas
//
//  Created by RAC on 07/07/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import UIKit
import WebKit

class ChatController: BaseViewController,WKNavigationDelegate {

    var checkPath:String!
    @IBOutlet weak var lbl_chatHeader: UILabel!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Global.shared.refreshOrNot = "yes"
        webView.navigationDelegate = self
        
        
        let currentLang =  LocalizationSystem.sharedInstance.getLanguage()
        
        
        
  
        
 //   https://chat.muzaini.com/amec-webchat/mobile.html?channelsrc=IOS&ChatPluginState=max&lang=ar
        
        lbl_chatHeader.text = Global.shared.loginChat
       // let gatewayUrl = NSURL(string: "https://csapi-uat.muzaini.com/amec-webchat/muzaini.html?channelsrc=IOS")
        var gatewayUrl = NSURL()
      
        if checkPath == "0"
        {
            gatewayUrl = NSURL(string: "https://chat.muzaini.com/amec-webchat/mobile.html?channelsrc=IOS&ChatPluginState=max&lang=\(currentLang)")!

        }
        else
        {
            let lastName = UserDefaults.standard.string(forKey: "lastName")!
            let firstName = UserDefaults.standard.string(forKey: "firstName")!
            let salute = UserDefaults.standard.string(forKey: "salutation")!
            let email = UserDefaults.standard.string(forKey: "displayEmail")!
            let mobile = UserDefaults.standard.string(forKey: "displayMobile")!
            let htmlStr =   "https://chat.muzaini.com/amec-webchat/mobile.html?channelsrc=IOS&ChatPluginState=max&lang=\(currentLang)&FName=\(firstName)&LName=\(lastName)&email=\(email)&mNumber=\(mobile)&salute=\(salute)%20"
            gatewayUrl = NSURL(string: htmlStr)!

        }
        
        let urlRequest = URLRequest(url: gatewayUrl as URL)
        webView?.load(urlRequest)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func onClickBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickChangeLaung(_ sender: UIButton) {
        Global.shared.languageChangeActn()
    }
    @IBAction func onClickLogout(_ sender: Any) {
        logout()
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.showSpinner(onView: self.view)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.removeSpinner()
        let urlString = webView.url?.absoluteString
        print(urlString)
            
      
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.removeSpinner()
    }
}
