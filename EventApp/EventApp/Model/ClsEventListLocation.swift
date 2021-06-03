//
//	ClsEventListLocation.swift
//  EventApp



import Foundation


class ClsEventListLocation : NSObject, NSCoding{

	var lat : Float!
	var lon : Float!


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
		lat = dictionary["lat"] as? Float == nil ? 0 : dictionary["lat"] as? Float
		lon = dictionary["lon"] as? Float == nil ? 0 : dictionary["lon"] as? Float
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if lat != nil{
			dictionary["lat"] = lat
		}
		if lon != nil{
			dictionary["lon"] = lon
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         lat = aDecoder.decodeObject(forKey: "lat") as? Float
         lon = aDecoder.decodeObject(forKey: "lon") as? Float

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if lat != nil{
			aCoder.encode(lat, forKey: "lat")
		}
		if lon != nil{
			aCoder.encode(lon, forKey: "lon")
		}

	}

}
