//
//	ClsEventListGenre.swift
//  EventApp



import Foundation


class ClsEventListGenre : NSObject, NSCoding{

	var documentSource : ClsEventListDocumentSource!
	var id : Int!
	var image : String!
	var images : ClsEventListImage!
	var name : String!
	var primary : Bool!
	var slug : String!


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
		image = dictionary["image"] as? String == nil ? "" : dictionary["image"] as? String
		if let imagesData = dictionary["images"] as? NSDictionary{
			images = ClsEventListImage(fromDictionary: imagesData)
		}
		else
		{
			images = ClsEventListImage(fromDictionary: NSDictionary.init())
		}
		name = dictionary["name"] as? String == nil ? "" : dictionary["name"] as? String
		primary = dictionary["primary"] as? Bool == nil ? false : dictionary["primary"] as? Bool
		slug = dictionary["slug"] as? String == nil ? "" : dictionary["slug"] as? String
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
		if image != nil{
			dictionary["image"] = image
		}
		if images != nil{
			dictionary["images"] = images.toDictionary()
		}
		if name != nil{
			dictionary["name"] = name
		}
		if primary != nil{
			dictionary["primary"] = primary
		}
		if slug != nil{
			dictionary["slug"] = slug
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
         image = aDecoder.decodeObject(forKey: "image") as? String
         images = aDecoder.decodeObject(forKey: "images") as? ClsEventListImage
         name = aDecoder.decodeObject(forKey: "name") as? String
         primary = aDecoder.decodeObject(forKey: "primary") as? Bool
         slug = aDecoder.decodeObject(forKey: "slug") as? String

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
		if image != nil{
			aCoder.encode(image, forKey: "image")
		}
		if images != nil{
			aCoder.encode(images, forKey: "images")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if primary != nil{
			aCoder.encode(primary, forKey: "primary")
		}
		if slug != nil{
			aCoder.encode(slug, forKey: "slug")
		}

	}

}
