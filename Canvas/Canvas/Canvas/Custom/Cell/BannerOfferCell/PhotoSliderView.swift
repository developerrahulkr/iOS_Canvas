import UIKit

// MARK: PhotoSliderView

class PhotoSliderView: UIView {
    
    // MARK: Outlets
    var timer: Timer!
    @IBOutlet var contentView: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    var currentPage = 1;
    var slideTimer : Timer?
    var controller : OfferViewController!
    var offerListArr = [[String:Any]]()
    var bannerList = [UIImage]()

    // MARK: Configure Methods
    
    func configure(with images: [UIImage]) {
        
        // Get the scrollView width and height
        let scrollViewWidth: CGFloat = scrollView.frame.width
        let scrollViewHeight: CGFloat = scrollView.frame.height
        
        // Loop through all of the images and add them all to the scrollView
        for (index, image) in images.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: scrollViewWidth * CGFloat(index),
                                                      y: 0,
                                                      width: scrollViewWidth,
                                                      height: scrollViewHeight))
            imageView.image = image
            imageView.tag = index
            imageView.contentMode = .scaleToFill
            imageView.clipsToBounds = true
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            //Add the recognizer to your view.
          //  imageView.addGestureRecognizer(tapRecognizer)
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
            scrollView.addSubview(imageView)
        }
        
        // Set the scrollView contentSize
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(images.count),
                                        height: scrollView.frame.height)
        
        // Ensure that the pageControl knows the number of pages
        pageControl.numberOfPages = images.count
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        print(tappedImage.tag)
        let offers = offerListArr[tappedImage.tag]
        let imageUrl = offers["externalUrl"] as? String ?? ""
        
        if imageUrl != "" && imageUrl != "null"
        {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OfferWebController") as? OfferWebController
       // self.navigationController?.pushViewController(vc!, animated: true)
      //  let vc = self.storyboard?.instantiateViewController(withIdentifier: "OfferWebController") as! OfferWebController
        vc!.str_url = imageUrl
        controller.navigationController!.pushViewController(vc!, animated: true)
      //  self.navigationController?.pushViewController(vc!, animated: true)
        }
        print(imageUrl)

        // Your action
    }
    
    // MARK: Init Methods
    var offSet: CGFloat = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    @objc func autoScroll() {
        let totalPossibleOffset = CGFloat(bannerList.count - 1) * contentView.bounds.size.width
        
        if offSet == totalPossibleOffset {
            offSet = 0
            pageControl.currentPage = 0// come back to the first image after the last image
        }
        else {
            
            offSet += contentView.bounds.size.width
            pageControl.currentPage = pageControl.currentPage + 1
        }
        DispatchQueue.main.async() {
            UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                self.scrollView.contentOffset.x = CGFloat(self.offSet)
            }, completion: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: PhotoSliderView.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // MARK: Helper Methods
    
    @IBAction func pageControlTap(_ sender: Any?) {
        guard let pageControl: UIPageControl = sender as? UIPageControl else {
            return
        }
        
        scrollToIndex(index: pageControl.currentPage)
    }
        
    
    private func scrollToIndex(index: Int) {
        let pageWidth: CGFloat = scrollView.frame.width
        let slideToX: CGFloat = CGFloat(index) * pageWidth
        
        scrollView.scrollRectToVisible(CGRect(x: slideToX, y:0, width:pageWidth, height:scrollView.frame.height), animated: true)
    }
}

// MARK: UIScrollViewDelegate

extension PhotoSliderView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        pageControl.currentPage = Int(currentPage)
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if timer.isValid {
          timer.invalidate()
        }
    }
}
