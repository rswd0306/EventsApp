//
//  HomeDetailVC.swift
//  EventApp



import UIKit

class HomeDetailVC: UIViewController {
    
    //MARK:-Variable Declaration
    
    var dictEventDetail = ClsEventListModel()
    var updateHanlder:() -> Void = {}
    
    //MARK:- Outlet Zone
    
    @IBOutlet weak var lblEventName:UILabel!
    @IBOutlet weak var lblDate:UILabel!
    @IBOutlet weak var lblLocation:UILabel!
    @IBOutlet weak var imgEvent:UIImageView!
    @IBOutlet weak var btnFavouriteOutlet:UIButton!
    
    //MARK:- ViewLife cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = " "
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.title = "Detail"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.titleView = nil
    }
    
    
    func setupData() {
        self.lblEventName.text = dictEventDetail.title
        self.lblLocation.text = dictEventDetail.venue.displayLocation
        
        let df = DateFormatter()
        df.dateFormat = df1
        let finalDate = df.date(from: dictEventDetail.datetimeLocal) ?? Date()
        
        df.dateFormat = df2
        let strEventDate = df.string(from: finalDate)
        self.lblDate.text = strEventDate
        
        if let arrId = defaults.object(forKey: kFav) as? [Int] {
            if arrId.firstIndex(where: {$0 == dictEventDetail.id}) != nil {
                self.btnFavouriteOutlet.isSelected = true                
            }
        }
        
        let cache = ImageLoadingWithCache()
        if dictEventDetail.performers.count > 0 {
            cache.getImage(url: dictEventDetail.performers[0].image, imageView: imgEvent, defaultImage: "ic_placeholder")
        } else {
            self.imgEvent.image = UIImage(named: "ic_placeholder")
        }
    }

}

//MARK:- Action Zone

extension HomeDetailVC {
    
    @IBAction func btnFavAction(_ sender:UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            if var arrId = defaults.object(forKey: kFav) as? [Int] {
                arrId.append(dictEventDetail.id)
                defaults.setValue(arrId, forKey: kFav)
            } else {
                var arrId = [Int]()
                arrId.append(dictEventDetail.id)
                defaults.setValue(arrId, forKey: kFav)
            }
        } else {
            if var arrId = defaults.object(forKey: kFav) as? [Int] {
                if let index = arrId.firstIndex(where: {$0 == dictEventDetail.id}) {
                    arrId.remove(at: index)
                    defaults.setValue(arrId, forKey: kFav)
                }
            }
        }
        updateHanlder()
        defaults.synchronize()
    }
}
