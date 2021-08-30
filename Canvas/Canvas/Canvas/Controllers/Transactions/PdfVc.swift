//
//  PdfVc.swift
//  Canvas
//
//  Created by urmila reddy on 11/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import WebKit

class PdfVc: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let urlRequest = URLRequest(url: Global.shared.pdfUrl as URL)
           //   webView = WKWebView(frame: self.view.frame)
                      webView?.load(urlRequest)
                   //  self.view.addSubview(webView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.setNavigationBarHidden(true, animated: animated)
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           navigationController?.setNavigationBarHidden(false, animated: animated)
       }
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
  
}
