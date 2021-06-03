//
//	ClsEventMeta.swift
//  EventApp
//


import Foundation


class ClsEventMeta : NSObject, NSCoding{

	var geolocation : String!
	var page : Int!
	var perPage : Int!
	var took : Int!
	var total : Int!


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
		geolocation = dictionary["geolocation"] as? String == nil ? "" : dictionary["geolocation"] as? String
		page = dictionary["page"] as? Int == nil ? 0 : dictionary["page"] as? Int
		perPage = dictionary["per_page"] as? Int == nil ? 0 : dictionary["per_page"] as? Int
		took = dictionary["took"] as? Int == nil ? 0 : dictionary["took"] as? Int
		total = dictionary["total"] as? Int == nil ? 0 : dictionary["total"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if geolocation != nil{
			dictionary["geolocation"] = geolocation
		}
		if page != nil{
			dictionary["page"] = page
		}
		if perPage != nil{
			dictionary["per_page"] = perPage
		}
		if took != nil{
			dictionary["took"] = took
		}
		if total != nil{
			dictionary["total"] = total
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         geolocation = aDecoder.decodeObject(forKey: "geolocation") as? String
         page = aDecoder.decodeObject(forKey: "page") as? Int
         perPage = aDecoder.decodeObject(forKey: "per_page") as? Int
         took = aDecoder.decodeObject(forKey: "took") as? Int
         total = aDecoder.decodeObject(forKey: "total") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if geolocation != nil{
			aCoder.encode(geolocation, forKey: "geolocation")
		}
		if page != nil{
			aCoder.encode(page, forKey: "page")
		}
		if perPage != nil{
			aCoder.encode(perPage, forKey: "per_page")
		}
		if took != nil{
			aCoder.encode(took, forKey: "took")
		}
		if total != nil{
			aCoder.encode(total, forKey: "total")
		}

	}

}
