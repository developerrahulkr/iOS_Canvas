//
//  OfferWebController.swift
//  Canvas
//
//  Created by RAC on 27/08/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import UIKit
import WebKit

class OfferWebController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var lbl_offer: UILabel!
    var str_url : String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        lbl_offer.text = Global.shared.menuOffer
        print(str_url)
        let gatewayUrl = NSURL(string: str_url)
        let urlRequest = URLRequest(url: gatewayUrl! as URL)
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
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        //self.showSpinner(onView: self.view)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      //  self.removeSpinner()
       // let urlString = webView.url?.absoluteString
            
      
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
       // self.removeSpinner()
    }
    
}
