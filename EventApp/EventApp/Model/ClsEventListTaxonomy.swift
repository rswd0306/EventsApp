//
//	ClsEventListTaxonomy.swift
//  EventApp



import Foundation


class ClsEventListTaxonomy : NSObject, NSCoding{

	var documentSource : ClsEventListDocumentSource!
	var id : Int!
	var name : String!
	var parentId : String!
	var rank : Int!
	var parentIntId : Int!


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
		if let documentSourceData = dictionary["document_source"] as? NSDictionary{
			documentSource = ClsEventListDocumentSource(fromDictionary: documentSourceData)
		}
		else
		{
			documentSource = ClsEventListDocumentSource(fromDictionary: NSDictionary.init())
		}
		id = dictionary["id"] as? Int == nil ? 0 : dictionary["id"] as? Int
		name = dictionary["name"] as? String == nil ? "" : dictionary["name"] as? String
		parentId = dictionary["parent_id"] as? String == nil ? "" : dictionary["parent_id"] as? String
		rank = dictionary["rank"] as? Int == nil ? 0 : dictionary["rank"] as? Int
        parentIntId = dictionary["parent_id"] as? Int == nil ? 0 : dictionary["parent_id"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if documentSource != nil{
			dictionary["document_source"] = documentSource.toDictionary()
		}
		if id != nil{
			dictionary["id"] = id
		}
		if name != nil{
			dictionary["name"] = name
		}
		if parentId != nil{
			dictionary["parent_id"] = parentId
		}
		if rank != nil{
			dictionary["rank"] = rank
		}
		if parentIntId != nil{
			dictionary["parent_id"] = parentIntId
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         documentSource = aDecoder.decodeObject(forKey: "document_source") as? ClsEventListDocumentSource
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         parentId = aDecoder.decodeObject(forKey: "parent_id") as? String
         rank = aDecoder.decodeObject(forKey: "rank") as? Int
         parentIntId = aDecoder.decodeObject(forKey: "parent_id") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if documentSource != nil{
			aCoder.encode(documentSource, forKey: "document_source")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if parentId != nil{
			aCoder.encode(parentId, forKey: "parent_id")
		}
		if rank != nil{
			aCoder.encode(rank, forKey: "rank")
		}
		if parentIntId != nil{
			aCoder.encode(parentIntId, forKey: "parent_id")
		}

	}

}
