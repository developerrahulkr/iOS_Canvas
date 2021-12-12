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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   Global.shared.fraudRemovePopUpWu = "AddEnable"
        Global.shared.refreshOrNot = "yes"
       webView.navigationDelegate = self
        
        navHeaderLbl.text = Global.shared.navTxtForPayment

        // Do any additional setup after loading the view.
   //     "http://15.207.206.161/paymentrequest?tid="
      //  http://15.207.206.161/home/paymentrequest
        
        
     //   present
        //http://15.207.206.161/home/paymentrequest?tid=
      
        //"https://online1.muzaini.com/paygate/paymentrequest?tid="
        
        //"http://online-uat.muzaini.com:83/paygate/paymentrequest?tid="
        
     //   "https://online1.muzaini.com/paygate/paymentrequest?tid="
       //  "http://online-uat.muzaini.com:8076/paygate/paymentrequest?tid="
      
        let gatewayUrl = NSURL(string: "http://online-uat.muzaini.com:83/paygate/paymentrequest?tid=" + BeneficiaryDetails.shared.txnRefNo)
        let urlRequest = URLRequest(url: gatewayUrl! as URL)
        webView?.load(urlRequest)
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.showSpinner(onView: self.view)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.removeSpinner()
        let urlString = webView.url?.absoluteString
            
        //Production
     //  if urlString == "https://online1.muzaini.com/paygate/PaymentSuccess"  || urlString == "https://online1.muzaini.com/paygate/PaymentError" {
           
    // Staging
           
        //   if urlString == "http://online-uat.muzaini.com:8076/paygate/PaymentSuccess"  || urlString == "http://online-uat.muzaini.com:8076/paygate/PaymentError" {
        
        //deployment
         if urlString == "http://online-uat.muzaini.com:83/paygate/PaymentSuccess"  || urlString == "http://online-uat.muzaini.com:83/paygate/PaymentError" {
                 
        //presnet development
            
      //  if urlString == "http://15.207.206.161/home/PaymentSuccess"  || urlString == "http://15.207.206.161/home/PaymentError"{
            self.hidesBottomBarWhenPushed = false
             self.pushViewController(controller: TransactionSuccesVc.initiateController())
       }

     //   else if urlString == "https://online1.muzaini.com/paygate/PaymentError" {
            
        //    else if urlString == "http://online-uat.muzaini.com:8076/paygate/PaymentError" {

         else if urlString == "http://online-uat.muzaini.com:83/paygate/PaymentError" {
          // else if urlString == "http://15.207.206.161/home/PaymentError" {
            self.hidesBottomBarWhenPushed = false
            self.pushViewController(controller: TransactionSuccesVc.initiateController())
            
        }
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.removeSpinner()
    }
    
    
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
    
    override func viewWillAppear(_ animated: Bool) {
             super.viewWillAppear(animated)
             navigationController?.setNavigationBarHidden(true, animated: animated)
    }
         
   override func viewWillDisappear(_ animated: Bool) {
             super.viewWillDisappear(animated)
             navigationController?.setNavigationBarHidden(false, animated: animated)
    
    }

    @IBAction func bckBtnActn(_ sender: Any) {
     //   self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func langugeChngeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
    @IBAction func logoutActn(_ sender: Any) {
        logout()
//        let refreshAlert = UIAlertController(title: Global.shared.logoutHeaderTxt, message: Global.shared.logoutTxt, preferredStyle: UIAlertController.Style.alert)
//        refreshAlert.view.tintColor = ColorCodes.newAppRed
//        refreshAlert.addAction(UIAlertAction(title: Global.shared.yesTxt, style: .default, handler: { (action: UIAlertAction!) in
//           self.pushViewController(controller: LoginVc.initiateController())
//        }))
//
//        refreshAlert.addAction(UIAlertAction(title: Global.shared.noTxt, style: .default, handler: { (action: UIAlertAction!) in
//            print("Handle Cancel Logic here")
//              refreshAlert.dismiss(animated: true, completion: nil)
//
//        }))
//
//        present(refreshAlert, animated: true, completion: nil)
    }
    
    
    
}
