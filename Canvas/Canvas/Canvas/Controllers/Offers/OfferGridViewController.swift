//
//  OfferGridViewController.swift
//  Canvas
//
//  Created by RAC on 28/09/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import UIKit

class OfferGridViewController: UIViewController {

    var offerList = [[String: Any]]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        offerList = appDelegate.offerList
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
       
        offerList = appDelegate.offerList
        collectionView.reloadData()
    }
}

extension OfferGridViewController : UICollectionViewDataSource
{
    //UICollectionViewDatasource methods
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            
            return 1
        }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(offerList.count)
        return self.offerList.count
        }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerGridCell", for: indexPath) as! BannerGridCell
       
        
        let offers = offerList[indexPath.row]
        let imageStr = offers["image"] as? String ?? ""
   
        let image1 = imageStr.base64ToImage()
        print(image1!)
        cell.bannerImg.contentMode = .scaleToFill
        cell.bannerImg.image = image1
     //   img.image = image1
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let offers = offerList[indexPath.row]
        let imageUrl = offers["externalUrl"] as? String ?? ""
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OfferWebController") as! OfferWebController
        vc.str_url = imageUrl
        self.navigationController?.pushViewController(vc, animated: true)
        print(imageUrl)
       
    }
    
}

extension OfferGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width-100, height: 150)
    }
}


