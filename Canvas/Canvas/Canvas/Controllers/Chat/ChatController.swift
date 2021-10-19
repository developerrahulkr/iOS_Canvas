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

    @IBOutlet weak var lbl_chatHeader: UILabel!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Global.shared.refreshOrNot = "yes"
        webView.navigationDelegate = self
        
        lbl_chatHeader.text = Global.shared.loginChat
        let gatewayUrl = NSURL(string: "https://csapi-uat.muzaini.com/amec-webchat/muzaini.html?channelsrc=IOS")
        let urlRequest = URLRequest(url: gatewayUrl! as URL)
        webView?.load(urlRequest)
       // https://csapi-uat.muzaini.com/amec-webchat/muzaini.html?channelsrc=IOS
        
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
        //self.showSpinner(onView: self.view)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      //  self.removeSpinner()
        let urlString = webView.url?.absoluteString
        print(urlString)
            
      
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
      //  self.removeSpinner()
    }
}
