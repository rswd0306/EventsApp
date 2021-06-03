//
//	ClsEventListImage.swift
//  EventApp



import Foundation


class ClsEventListImage : NSObject, NSCoding{
	var banner : String!
	var block : String!
	var criteo130160 : String!
	var criteo170235 : String!
	var criteo205100 : String!
	var criteo400300 : String!
	var fb100x72 : String!
	var fb600315 : String!
	var huge : String!
	var ipadEventModal : String!
	var ipadHeader : String!
	var ipadMiniExplore : String!
	var mongo : String!
	var squareMid : String!
	var triggitFbAd : String!


	/**
	 * Overiding init method
	 */
	init(fromDictionary dictionary: NSDictionary)
	{
		super.init()
		parseJSONData(fromDictionary: dictionary)
	}

	/**
	 * Overiding init method
	 */
	override init(){
	}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	@objc func parseJSONData(fromDictionary dictionary: NSDictionary)
	{
		banner = dictionary["banner"] as? String == nil ? "" : dictionary["banner"] as? String
		block = dictionary["block"] as? String == nil ? "" : dictionary["block"] as? String
		criteo130160 = dictionary["criteo_130_160"] as? String == nil ? "" : dictionary["criteo_130_160"] as? String
		criteo170235 = dictionary["criteo_170_235"] as? String == nil ? "" : dictionary["criteo_170_235"] as? String
		criteo205100 = dictionary["criteo_205_100"] as? String == nil ? "" : dictionary["criteo_205_100"] as? String
		criteo400300 = dictionary["criteo_400_300"] as? String == nil ? "" : dictionary["criteo_400_300"] as? String
		fb100x72 = dictionary["fb_100x72"] as? String == nil ? "" : dictionary["fb_100x72"] as? String
		fb600315 = dictionary["fb_600_315"] as? String == nil ? "" : dictionary["fb_600_315"] as? String
		huge = dictionary["huge"] as? String == nil ? "" : dictionary["huge"] as? String
		ipadEventModal = dictionary["ipad_event_modal"] as? String == nil ? "" : dictionary["ipad_event_modal"] as? String
		ipadHeader = dictionary["ipad_header"] as? String == nil ? "" : dictionary["ipad_header"] as? String
		ipadMiniExplore = dictionary["ipad_mini_explore"] as? String == nil ? "" : dictionary["ipad_mini_explore"] as? String
		mongo = dictionary["mongo"] as? String == nil ? "" : dictionary["mongo"] as? String
		squareMid = dictionary["square_mid"] as? String == nil ? "" : dictionary["square_mid"] as? String
		triggitFbAd = dictionary["triggit_fb_ad"] as? String == nil ? "" : dictionary["triggit_fb_ad"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
        
		if banner != nil{
			dictionary["banner"] = banner
		}
		if block != nil{
			dictionary["block"] = block
		}
		if criteo130160 != nil{
			dictionary["criteo_130_160"] = criteo130160
		}
		if criteo170235 != nil{
			dictionary["criteo_170_235"] = criteo170235
		}
		if criteo205100 != nil{
			dictionary["criteo_205_100"] = criteo205100
		}
		if criteo400300 != nil{
			dictionary["criteo_400_300"] = criteo400300
		}
		if fb100x72 != nil{
			dictionary["fb_100x72"] = fb100x72
		}
		if fb600315 != nil{
			dictionary["fb_600_315"] = fb600315
		}
		if huge != nil{
			dictionary["huge"] = huge
		}
		if ipadEventModal != nil{
			dictionary["ipad_event_modal"] = ipadEventModal
		}
		if ipadHeader != nil{
			dictionary["ipad_header"] = ipadHeader
		}
		if ipadMiniExplore != nil{
			dictionary["ipad_mini_explore"] = ipadMiniExplore
		}
		if mongo != nil{
			dictionary["mongo"] = mongo
		}
		if squareMid != nil{
			dictionary["square_mid"] = squareMid
		}
		if triggitFbAd != nil{
			dictionary["triggit_fb_ad"] = triggitFbAd
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         banner = aDecoder.decodeObject(forKey: "banner") as? String
         block = aDecoder.decodeObject(forKey: "block") as? String
         criteo130160 = aDecoder.decodeObject(forKey: "criteo_130_160") as? String
         criteo170235 = aDecoder.decodeObject(forKey: "criteo_170_235") as? String
         criteo205100 = aDecoder.decodeObject(forKey: "criteo_205_100") as? String
         criteo400300 = aDecoder.decodeObject(forKey: "criteo_400_300") as? String
         fb100x72 = aDecoder.decodeObject(forKey: "fb_100x72") as? String
         fb600315 = aDecoder.decodeObject(forKey: "fb_600_315") as? String
         huge = aDecoder.decodeObject(forKey: "huge") as? String
         ipadEventModal = aDecoder.decodeObject(forKey: "ipad_event_modal") as? String
         ipadHeader = aDecoder.decodeObject(forKey: "ipad_header") as? String
         ipadMiniExplore = aDecoder.decodeObject(forKey: "ipad_mini_explore") as? String
         mongo = aDecoder.decodeObject(forKey: "mongo") as? String
         squareMid = aDecoder.decodeObject(forKey: "square_mid") as? String
         triggitFbAd = aDecoder.decodeObject(forKey: "triggit_fb_ad") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if banner != nil{
			aCoder.encode(banner, forKey: "banner")
		}
		if block != nil{
			aCoder.encode(block, forKey: "block")
		}
		if criteo130160 != nil{
			aCoder.encode(criteo130160, forKey: "criteo_130_160")
		}
		if criteo170235 != nil{
			aCoder.encode(criteo170235, forKey: "criteo_170_235")
		}
		if criteo205100 != nil{
			aCoder.encode(criteo205100, forKey: "criteo_205_100")
		}
		if criteo400300 != nil{
			aCoder.encode(criteo400300, forKey: "criteo_400_300")
		}
		if fb100x72 != nil{
			aCoder.encode(fb100x72, forKey: "fb_100x72")
		}
		if fb600315 != nil{
			aCoder.encode(fb600315, forKey: "fb_600_315")
		}
		if huge != nil{
			aCoder.encode(huge, forKey: "huge")
		}
		if ipadEventModal != nil{
			aCoder.encode(ipadEventModal, forKey: "ipad_event_modal")
		}
		if ipadHeader != nil{
			aCoder.encode(ipadHeader, forKey: "ipad_header")
		}
		if ipadMiniExplore != nil{
			aCoder.encode(ipadMiniExplore, forKey: "ipad_mini_explore")
		}
		if mongo != nil{
			aCoder.encode(mongo, forKey: "mongo")
		}
		if squareMid != nil{
			aCoder.encode(squareMid, forKey: "square_mid")
		}
		if triggitFbAd != nil{
			aCoder.encode(triggitFbAd, forKey: "triggit_fb_ad")
		}

	}

}
