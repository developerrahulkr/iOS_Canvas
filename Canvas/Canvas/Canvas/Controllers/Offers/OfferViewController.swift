//
//  OfferViewController.swift
//  Canvas
//
//  Created by RAC on 31/08/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class OfferViewController: BaseViewController {
   // @IBOutlet weak var pageControl: UIPageControl!
    var expandedCells = 1111111
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var gridView: UIView!
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var photoSliderView: PhotoSliderView!
    @IBOutlet weak var btn_list: UIButton!
    @IBOutlet weak var btn_grid: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let reuseIdentifier = "BannerOfferCell";
    let tab1 = "ShowOffersCell"
    let tab2 = "BannerImgCell"
    var checkBtn = "0"
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lbl_header: UILabel!
    var offerList = [[String: Any]]()
    var bannerList = [UIImage]()
   // @IBOutlet weak var bannerCollectionView: UICollectionView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var screenSize: CGRect!
       var screenWidth: CGFloat!
       var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // Do any additional setup after loading the view.
      //  tableView.register(BannerImgCell.self, forCellReuseIdentifier: tab2)
       // tableView.register(ShowOffersCell.self, forCellReuseIdentifier: tab1)
        // Set automatic dimensions for row height
        lbl_header.text = Global.shared.menuOffer
      
  //      self.tableView.estimatedRowHeight = 140;
      //  tableView.rowHeight = UITableView.automaticDimension
     //   tableView.estimatedRowHeight = 130
       
      //  tableView.rowHeight = UITableView.automaticDimension
      //  tableView.estimatedRowHeight = UITableView.automaticDimension
        
        self.tableView.estimatedRowHeight = 140
        self.tableView.rowHeight = UITableView.automaticDimension
         self.tableView.setNeedsLayout()
         self.tableView.layoutIfNeeded()
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)

     //   self.tableView.estimatedRowHeight = tableView.estimatedRowHeight
        btn_list.setImage(UIImage(named: "listGrey"), for: .normal)
        btn_grid.setImage(UIImage(named: "dashboardTab"), for: .normal)
        Global.shared.refreshOrNot = "yes"
        listView.isHidden = true
        gridView.isHidden = false
        checkBtn = "0"
        collectionView.delegate = self
        tableView.delegate = self
        
      //  lbl_header.font = Global.shared.fontBottomLbl
       // lbl_header.textColor = ColorCodes.newAppRed
        DispatchQueue.main.async {
            self.getOfferList()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
//        tableView.estimatedRowHeight = 130.0
//        tableView.rowHeight = UITableView.automaticDimension
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
      
      //  startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    var index = 0
    func getOfferList() {
        let paramaterPasing: [String:Any] = ["offerType":0,"DeviceType":3,"language":LocalizationSystem.sharedInstance.getLanguage(),"RegistrationId":Global.shared.afterLoginRegistrtnId ?? ""]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        self.showSpinner(onView: self.view)
        NetWorkDataManager.sharedInstance.getOfferList(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
              // print(resonseTal)
                self.removeSpinner()
                if let offers = resonseTal?.value(forKey: "listOffersResponseModel") as? NSArray
                {
                    self.offerList = offers as! [[String : Any]]
                    
                   // print(self.offerList)
                    while  self.index < self.offerList.count{
                        let offers = self.offerList[self.index]
                        let imageStr = offers["image"] as? String ?? ""
                        var image1 = imageStr.base64ToImage()
                        if image1  != nil
                        {
                           self.bannerList.append(image1!)
                        }
//                        else
//                        {
//                            image1 = UIImage(named: "offerThumbImg")
//                            self.bannerList.append(image1!)
//                        }
                        self.index = self.index + 1
                    }
                    self.appDelegate.offerList = self.offerList
                    self.photoSliderView.controller = self
                    self.photoSliderView.offerListArr = self.offerList
                    self.photoSliderView.configure(with: self.bannerList)
                    self.photoSliderView.bannerList = self.bannerList
                    UIView.animate(withDuration: 0.9,
                    delay: 0.2,
                    options: UIView.AnimationOptions.transitionCurlDown,
                    animations: {
                        self.collectionView.reloadData()
                        self.tableView.reloadData()
                        
                    },completion: nil)
                    
                }
              
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
    @IBAction func onClickBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func onClickLogOut(_ sender: Any) {
        logout()
    }
    @IBAction func onClickChangeLang(_ sender: Any) {
       
        Global.shared.languageChangeActn()
    }
    
    @IBAction func onClickListBtn(_ sender: Any) {
        checkBtn = "1"
        btn_list.setImage(UIImage(named: "listviewImg"), for: .normal)
        btn_grid.setImage(UIImage(named: "gridGrey"), for: .normal)
        gridView.isHidden = true
        UIView.animate(withDuration: 0.9,
        delay: 0.2,
        options: UIView.AnimationOptions.transitionCurlDown,
        animations: {
            self.listView.isHidden = false
            self.tableView.estimatedRowHeight = UITableView.automaticDimension
            self.tableView.rowHeight = 140
            self.tableView.setNeedsLayout()
            self.tableView.layoutIfNeeded()
            self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
            self.tableView.reloadData()
            
        },completion: nil)
        
        
        
       
    }
    @IBAction func onClickGridBtn(_ sender: Any) {
        checkBtn = "0"
        btn_list.setImage(UIImage(named: "listGrey"), for: .normal)
        btn_grid.setImage(UIImage(named: "dashboardTab"), for: .normal)
        listView.isHidden = true
        UIView.animate(withDuration: 0.9,
        delay: 0.2,
        options: UIView.AnimationOptions.transitionCurlDown,
        animations: {
            self.gridView.isHidden = false
            self.collectionView.reloadData()
            
        },completion: nil)
       
        
        
       
    }
}
extension OfferViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offerList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
       
            let cell:ShowOffersCell = tableView.dequeueReusableCell(withIdentifier: tab1, for: indexPath) as! ShowOffersCell
             cell.selectionStyle = .none
             cell.tag = indexPath.row
            let offers = offerList[indexPath.row]
            let imageStr = offers["image"] as? String ?? ""
            let image1 = imageStr.base64ToImage()
            cell.img_thumbnail.contentMode = .scaleToFill
        
       
      //  DispatchQueue.main.async(execute: {() -> Void in

            if cell.tag == indexPath.row {
                if image1 != nil{
                    cell.img_thumbnail.image = image1
                    cell.img_widthConstraint.constant = 120
                    cell.img_heightConstraint.constant = 120
                    cell.img_thumbnail.layoutIfNeeded()
                }
                else{
                    cell.img_widthConstraint.constant = 0
                    cell.img_thumbnail.layoutIfNeeded()
                    
                }
            }
            cell.btn_more.tag = indexPath.row
       // cell.btn_more.addTarget(self, action: #selector(OfferViewController.btnAction(_:)), for: .touchUpInside)
        cell.btn_more.addTarget(self, action: #selector(self.btnAction(_:)), for: UIControl.Event.touchUpInside)
            let description = offers["description"] as? String ?? ""
            cell.lbl_offerHeader.text = offers["title"] as? String ?? ""
            cell.lbl_offerHeader.font = Global.shared.fontHeader
            cell.lbl_offerDescription.font = Global.shared.fontTopLbl
            cell.lbl_offerDescription.text = description
            cell.lbl_offerDescription.sizeToFit()
        print(description.count)
        cell.btn_more.titleLabel?.font =  Global.shared.fontReqLbl
        if expandedCells == indexPath.row
        {
            cell.btn_more.setTitle("Less", for: .normal)
        }
        else{
            cell.btn_more.setTitle("More", for: .normal)
        }
        if description.count <= 60
        {
            cell.btn_more.setTitle("", for: .normal)
        }
        
               return cell
            
        }
    @objc func btnAction(_ sender: UIButton) {
       
        if sender.tag != expandedCells
        {
           expandedCells = sender.tag
            
        }
        else
        {
            expandedCells = 111111
        }
        
        tableView.reloadData()
       
   }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

            //MARK:- Fade transition Animation
//            cell.alpha = 0
//            UIView.animate(withDuration: 0.55) {
//                cell.alpha = 1
//            }

//            //MARK:- Curl transition Animation
//            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, -1, 1, 1)
//
//            UIView.animate(withDuration: 0.4) {
//                cell.layer.transform = CATransform3DIdentity
//            }

 //           MARK:- Frame Translation Animation
//            cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -cell.frame.width, 1, 1)
//
//            UIView.animate(withDuration: 0.83) {
//                cell.layer.transform = CATransform3DIdentity
        
        cell.alpha = 0
                cell.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0.8)
                UIView.animate(withDuration: 0.4) {
                    cell.alpha = 1
                    cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
                }
//            }
        
        cell.layoutIfNeeded()
     
                
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let offers = self.offerList[indexPath.row]
        let imageUrl = offers["externalUrl"] as? String ?? ""
        if imageUrl != "null" && imageUrl != ""
        {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OfferWebController") as! OfferWebController
        vc.str_url = imageUrl
        self.navigationController?.pushViewController(vc, animated: true)
        }
        print(imageUrl)
    }
}
extension OfferViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      

        if expandedCells == indexPath.row
        {
            return UITableView.automaticDimension
        }

        else{
            
            return 150
        }

        //yourTableView.rowHeight = UITableViewAutomaticDimension
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return 130
//        }

       

//        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//            cell.layoutIfNeeded()
//        }
}

extension OfferViewController : UICollectionViewDataSource
{
    //UICollectionViewDatasource methods
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            
            return 1
        }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // print(offerList.count)
        return self.bannerList.count
        }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerGridCell", for: indexPath) as! BannerGridCell
       
        
        let image = bannerList[indexPath.row]
       // let imageStr = offers["image"] as? String ?? ""
       // let image1 = imageStr.base64ToImage()
        cell.bannerImg.layer.cornerRadius = 15
        cell.bannerImg.layer.masksToBounds = true
        cell.bannerImg.contentMode = .scaleToFill
        cell.bannerImg.image = image
     //   img.image = image1
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let offers = offerList[indexPath.row]
        let imageUrl = offers["externalUrl"] as? String ?? ""
        
        if imageUrl != "" || imageUrl != "null"
        {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OfferWebController") as! OfferWebController
        vc.str_url = imageUrl
        self.navigationController?.pushViewController(vc, animated: true)
        print(imageUrl)
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                willDisplay cell: UICollectionViewCell,
                                forItemAt indexPath: IndexPath) {
       
//       cell.alpha = 0
//       UIView.animate(withDuration: 0.8) {
//           cell.alpha = 1
//       }
//        cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -cell.frame.width, 1, 1)
//
//        UIView.animate(withDuration: 0.83) {
//            cell.layer.transform = CATransform3DIdentity
//        }
        
                cell.alpha = 0
                cell.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0.8)
                UIView.animate(withDuration: 0.4) {
                    cell.alpha = 1
                    cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
                }
   }
    
}

extension OfferViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 2) - 10), height: ((collectionView.frame.size.width / 2) - 10))
      //  return CGSize(width: 150, height: 150)
//        let cellsAcross: CGFloat = 3
//           let spaceBetweenCells: CGFloat = 1
//           let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
//
//           return CGSize(width: dim, height: dim)
        
    }
    
    // Distance Between Item Cells
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }
 
       
       // Cell Margin
//       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//           return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//       }

}





