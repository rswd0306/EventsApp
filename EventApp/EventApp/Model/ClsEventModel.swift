//
//	ClsEventModel.swift
//  EventApp
//


import Foundation


class ClsEventModel : NSObject, NSCoding{

	var events : [ClsEventListModel]!
	var inHand : ClsEventInHand!
	var meta : ClsEventMeta!


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
		events = [ClsEventListModel]()
		if let eventsArray = dictionary["events"] as? [NSDictionary]{
			for dic in eventsArray{
				let value = ClsEventListModel(fromDictionary: dic)
				events.append(value)
			}
		}
		if let inHandData = dictionary["in_hand"] as? NSDictionary{
			inHand = ClsEventInHand(fromDictionary: inHandData)
		}
		else
		{
			inHand = ClsEventInHand(fromDictionary: NSDictionary.init())
		}
		if let metaData = dictionary["meta"] as? NSDictionary{
			meta = ClsEventMeta(fromDictionary: metaData)
		}
		else
		{
			meta = ClsEventMeta(fromDictionary: NSDictionary.init())
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if events != nil{
			var dictionaryElements = [NSDictionary]()
			for eventsElement in events {
				dictionaryElements.append(eventsElement.toDictionary())
			}
			dictionary["events"] = dictionaryElements
		}
		if inHand != nil{
			dictionary["in_hand"] = inHand.toDictionary()
		}
		if meta != nil{
			dictionary["meta"] = meta.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         events = aDecoder.decodeObject(forKey: "events") as? [ClsEventListModel]
         inHand = aDecoder.decodeObject(forKey: "in_hand") as? ClsEventInHand
         meta = aDecoder.decodeObject(forKey: "meta") as? ClsEventMeta

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if events != nil{
			aCoder.encode(events, forKey: "events")
		}
		if inHand != nil{
			aCoder.encode(inHand, forKey: "in_hand")
		}
		if meta != nil{
			aCoder.encode(meta, forKey: "meta")
		}

	}

}
