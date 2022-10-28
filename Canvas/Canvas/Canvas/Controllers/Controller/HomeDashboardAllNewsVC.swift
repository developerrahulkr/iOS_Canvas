//
//  HomeDashboardAllNewsVC.swift
//  Canvas
//
//  Created by Akshay_mac on 28/10/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class HomeDashboardAllNewsVC: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var tablView: UITableView!
    
    lazy var allNewsDataSource : [CMLatestNews] = {
        let data = [CMLatestNews]()
        return data
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        AllNewsAPI()
        cardView.addDropShadowToView(targetView: cardView)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.isToolbarHidden = true
        tablView.register(UINib(nibName: "HomeLatestNewCell", bundle: nil), forCellReuseIdentifier: "HomeLatestNewCell")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func onClickedLangChange(_ sender: UIButton) {
        Global.shared.languageChangeActn()
    }
    
    @IBAction func onClickedLogout(_ sender: UIButton) {
        logout()
    }
    
    @IBAction func onClickedBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension HomeDashboardAllNewsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNewsDataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeLatestNewCell", for: indexPath) as! HomeLatestNewCell
        cell.img.kf.setImage(with: URL(string: allNewsDataSource[indexPath.row].thumbNailFileName ?? ""))
        cell.lblTitle.text = allNewsDataSource[indexPath.row].title ?? ""
        cell.lblDesc.text = allNewsDataSource[indexPath.row].content ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}


extension HomeDashboardAllNewsVC {
    func AllNewsAPI() {
        self.showSpinner(onView: self.view)
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(),
                                             "channel": "1"]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.allNews(headersTobePassed: headers, postParameters: paramaterPasing) { responseData, errorString in
            self.removeSpinner()
            guard errorString == nil else{
                self.removeSpinner()
                NetWorkDataManager.sharedInstance.callChannelException()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
            let maxNewsItems = responseData?.value(forKey: "maxNewsItem") as? Int ?? 0
            let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
            if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                if statusCode == 200 {
                    if let newsItems = responseData?.value(forKey: "newsItems") as? NSArray {
                        for onemessage in newsItems as! [Dictionary<String, AnyObject>] {
                            
                            self.allNewsDataSource.append(CMLatestNews(startDate: onemessage["startDate"] as? String,
                                                                          endDate: onemessage["endDate"] as? String,
                                                                          title: onemessage["title"] as? String,
                                                                          thumbNailFileName: onemessage["thumbNailFileName"] as? String,
                                                                          url: onemessage["url"] as? String,
                                                                          content: onemessage["content"] as? String,
                                                                          language: onemessage["language"] as? String,
                                                                          id: onemessage["id"] as? Int,
                                                                          channelID: onemessage["channelID"] as? Int,
                                                                          sequence: onemessage["sequence"] as? Int))
//                            self.selectDateDataSource.append(CMSelectDate(id: onemessage["id"] as? String, sDate: onemessage["sDate"] as? String))
                        }
                    }
                    
                    print("latestNewsData is \(self.allNewsDataSource)")
                    self.tablView.reloadData()
                }
                
            }
            
            
            
        }
    }
}
