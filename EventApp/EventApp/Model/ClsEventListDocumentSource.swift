//
//	ClsEventListDocumentSource.swift
//  EventApp



import Foundation


class ClsEventListDocumentSource : NSObject, NSCoding{

	var generationType : String!
	var sourceType : String!


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
		generationType = dictionary["generation_type"] as? String == nil ? "" : dictionary["generation_type"] as? String
		sourceType = dictionary["source_type"] as? String == nil ? "" : dictionary["source_type"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if generationType != nil{
			dictionary["generation_type"] = generationType
		}
		if sourceType != nil{
			dictionary["source_type"] = sourceType
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         generationType = aDecoder.decodeObject(forKey: "generation_type") as? String
         sourceType = aDecoder.decodeObject(forKey: "source_type") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if generationType != nil{
			aCoder.encode(generationType, forKey: "generation_type")
		}
		if sourceType != nil{
			aCoder.encode(sourceType, forKey: "source_type")
		}

	}

}
