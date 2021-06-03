//
//  HomeCell.swift
//  EventApp



import UIKit

class HomeCell: UITableViewCell {
    
    //MARK:- Variable Declaration
    
    @IBOutlet weak var viewOuter:UIView!
    @IBOutlet weak var imgEvent:UIImageView!
    @IBOutlet weak var lblEventName:UILabel!
    @IBOutlet weak var lblDescription:UILabel!
    @IBOutlet weak var lblDate:UILabel!
    @IBOutlet weak var btnFavOutlet:UIButton!
    
    //MARK:- ViewLife Cycle

    override func awakeFromNib() {
        super.awakeFromNib()      
        
        
        viewOuter.layer.cornerRadius = 10

        viewOuter.layer.shadowColor = UIColor.black.cgColor
        viewOuter.layer.shadowOffset = CGSize(width: 1, height: 1)
        viewOuter.layer.shadowOpacity = 0.3
        viewOuter.layer.shadowRadius = 4.0
//        viewOuter.layer.masksToBounds = true
        
    }
    
    override func draw(_ rect: CGRect) {
        imgEvent.clipsToBounds = true
        imgEvent.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
