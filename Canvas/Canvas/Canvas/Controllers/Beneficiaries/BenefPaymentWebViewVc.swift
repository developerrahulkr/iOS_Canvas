//
//  BenefPaymentWebViewVc.swift
//  Canvas
//
//  Created by urmila reddy on 11/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import WebKit

class BenefPaymentWebViewVc: UIViewController, WKNavigationDelegate {

    
    @IBOutlet weak var navHeaderLbl: UILabel!
    @IBOutlet weak var webView: WKWebView!
    var isfromfxbooking = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        Global.shared.refreshOrNot = "yes"
        webView.navigationDelegate = self
        navHeaderLbl.text = Global.shared.navTxtForPayment
        let urlstr = isfromfxbooking ? "\(CanvasUrls.baseurl_payment)paygateFXBooking/paymentrequest?tid=\(FXbookingMaster.shared.txnRefNo)" : "\(CanvasUrls.baseurl_payment)/paygate/paymentrequest?tid=\(String(describing: BeneficiaryDetails.shared.txnRefNo!))"
        let gatewayUrl = NSURL(string: urlstr)
        print("payment gatway initiate URL =========> \(String(describing: gatewayUrl))")
        let urlRequest = URLRequest(url: gatewayUrl! as URL)
        webView?.load(urlRequest)
    }
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
    {
        self.showSpinner(onView: self.view)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    {
        self.removeSpinner()
        let urlString = webView.url?.absoluteString
        print("Redirected URL =========> \(urlString ?? "something went wrong")")
        if(isfromfxbooking)
        {
            if urlString!.lowercased() == "\(CanvasUrls.baseurl_payment)paygateFXBooking/PaymentSuccess".lowercased()  || urlString!.lowercased() ==                      "\(CanvasUrls.baseurl_payment)paygateFXBooking/PaymentError".lowercased()
            {
                self.hidesBottomBarWhenPushed = false
                let vc = Storyboad.shared.fxBookingStoryboard?.instantiateViewController(withIdentifier: "FinalSummaryVC") as! FinalSummaryVC
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        else
        {
            if urlString == "\(CanvasUrls.baseurl_payment)paygate/PaymentSuccess"  || urlString == "\(CanvasUrls.baseurl_payment)paygate/PaymentError"
            {
                self.hidesBottomBarWhenPushed = false
                self.pushViewController(controller: TransactionSuccesVc.initiateController())
            }
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error)
    {
        self.removeSpinner()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
         
   override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func bckBtnActn(_ sender: Any) {
     //   self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func langugeChngeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
    @IBAction func logoutActn(_ sender: Any)
    {
        logout()
    }
}























// Do any additional setup after loading the view.
//     "http://15.207.206.161/paymentrequest?tid="
//  http://15.207.206.161/home/paymentrequest


//   present
//http://15.207.206.161/home/paymentrequest?tid=

//"https://online1.muzaini.com/paygate/paymentrequest?tid="

// For UAT
//"http://online-uat.muzaini.com:83/paygate/paymentrequest?tid="


//  For Live
//   "https://online1.muzaini.com/paygate/paymentrequest?tid="

// Staging
//  "http://online-uat.muzaini.com:8076/paygate/paymentrequest?tid="

// forUAT FX bookinng
// "http://online-uat.muzaini.com:83/paygateFXBooking/paymentrequest?tid="

//            if urlString!.lowercased() == "http://online-uat.muzaini.com:8076/paygateFXBooking/PaymentSuccess".lowercased()  || urlString!.lowercased() == "http://online-uat.muzaini.com:8076/paygateFXBooking/PaymentError".lowercased()
//            {


//deployment
//             if urlString == "http://online-uat.muzaini.com:83/paygate/PaymentSuccess"  || urlString == "http://online-uat.muzaini.com:83/paygate/PaymentError" {
         
//presnet development
    
//  if urlString == "http://15.207.206.161/home/PaymentSuccess"  || urlString == "http://15.207.206.161/home/PaymentError"{
//Production
//     if urlString == "https://online1.muzaini.com/paygate/PaymentSuccess"  || urlString == "https://online1.muzaini.com/paygate/PaymentError" {
   
// Staging
   

/*    func webViewDidFinishLoad(_ webView: UIWebView) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false

    let urlString = webView.request!.url!.absoluteString
    print("MY WEBVIEW URL: \(urlString)")
    
    
    //deployment
  //   if urlString == "http://168.187.217.88:83/home/PaymentSuccess"  || urlString == "http://168.187.217.88:83/home/PaymentError"{
    
    //presnet development
    if urlString == "http://15.207.206.161/home/PaymentSuccess"  || urlString == "http://15.207.206.161/home/PaymentError"{
        
        let vc = self.storyboard?.instantiateViewController(identifier: "TransactionSuccesVc") as! TransactionSuccesVc
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}*/
