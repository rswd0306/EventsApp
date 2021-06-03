//
//	ClsEventListVenue.swift
//  EventApp



import Foundation


class ClsEventListVenue : NSObject, NSCoding{

	var accessMethod : String!
	var address : String!
	var capacity : Int!
	var city : String!
	var country : String!
	var displayLocation : String!
	var extendedAddress : String!
	var hasUpcomingEvents : Bool!
	var id : Int!
	var links : [String]!
	var location : ClsEventListLocation!
	var metroCode : Int!
	var name : String!
	var nameV2 : String!
	var numUpcomingEvents : Int!
	var popularity : Int!
	var postalCode : String!
	var score : Float!
	var slug : String!
	var state : String!
	var timezone : String!
	var url : String!


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
		accessMethod = dictionary["access_method"] as? String == nil ? "" : dictionary["access_method"] as? String
		address = dictionary["address"] as? String == nil ? "" : dictionary["address"] as? String
		capacity = dictionary["capacity"] as? Int == nil ? 0 : dictionary["capacity"] as? Int
		city = dictionary["city"] as? String == nil ? "" : dictionary["city"] as? String
		country = dictionary["country"] as? String == nil ? "" : dictionary["country"] as? String
		displayLocation = dictionary["display_location"] as? String == nil ? "" : dictionary["display_location"] as? String
		extendedAddress = dictionary["extended_address"] as? String == nil ? "" : dictionary["extended_address"] as? String
		hasUpcomingEvents = dictionary["has_upcoming_events"] as? Bool == nil ? false : dictionary["has_upcoming_events"] as? Bool
		id = dictionary["id"] as? Int == nil ? 0 : dictionary["id"] as? Int
		links = dictionary["links"] as? [String] == nil ? [] : dictionary["links"] as? [String]
		if let locationData = dictionary["location"] as? NSDictionary{
			location = ClsEventListLocation(fromDictionary: locationData)
		}
		else
		{
			location = ClsEventListLocation(fromDictionary: NSDictionary.init())
		}
		metroCode = dictionary["metro_code"] as? Int == nil ? 0 : dictionary["metro_code"] as? Int
		name = dictionary["name"] as? String == nil ? "" : dictionary["name"] as? String
		nameV2 = dictionary["name_v2"] as? String == nil ? "" : dictionary["name_v2"] as? String
		numUpcomingEvents = dictionary["num_upcoming_events"] as? Int == nil ? 0 : dictionary["num_upcoming_events"] as? Int
		popularity = dictionary["popularity"] as? Int == nil ? 0 : dictionary["popularity"] as? Int
		postalCode = dictionary["postal_code"] as? String == nil ? "" : dictionary["postal_code"] as? String
		score = dictionary["score"] as? Float == nil ? 0 : dictionary["score"] as? Float
		slug = dictionary["slug"] as? String == nil ? "" : dictionary["slug"] as? String
		state = dictionary["state"] as? String == nil ? "" : dictionary["state"] as? String
		timezone = dictionary["timezone"] as? String == nil ? "" : dictionary["timezone"] as? String
		url = dictionary["url"] as? String == nil ? "" : dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if accessMethod != nil{
			dictionary["access_method"] = accessMethod
		}
		if address != nil{
			dictionary["address"] = address
		}
		if capacity != nil{
			dictionary["capacity"] = capacity
		}
		if city != nil{
			dictionary["city"] = city
		}
		if country != nil{
			dictionary["country"] = country
		}
		if displayLocation != nil{
			dictionary["display_location"] = displayLocation
		}
		if extendedAddress != nil{
			dictionary["extended_address"] = extendedAddress
		}
		if hasUpcomingEvents != nil{
			dictionary["has_upcoming_events"] = hasUpcomingEvents
		}
		if id != nil{
			dictionary["id"] = id
		}
		if links != nil{
			dictionary["links"] = links
		}
		if location != nil{
			dictionary["location"] = location.toDictionary()
		}
		if metroCode != nil{
			dictionary["metro_code"] = metroCode
		}
		if name != nil{
			dictionary["name"] = name
		}
		if nameV2 != nil{
			dictionary["name_v2"] = nameV2
		}
		if numUpcomingEvents != nil{
			dictionary["num_upcoming_events"] = numUpcomingEvents
		}
		if popularity != nil{
			dictionary["popularity"] = popularity
		}
		if postalCode != nil{
			dictionary["postal_code"] = postalCode
		}
		if score != nil{
			dictionary["score"] = score
		}
		if slug != nil{
			dictionary["slug"] = slug
		}
		if state != nil{
			dictionary["state"] = state
		}
		if timezone != nil{
			dictionary["timezone"] = timezone
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         accessMethod = aDecoder.decodeObject(forKey: "access_method") as? String
         address = aDecoder.decodeObject(forKey: "address") as? String
         capacity = aDecoder.decodeObject(forKey: "capacity") as? Int
         city = aDecoder.decodeObject(forKey: "city") as? String
         country = aDecoder.decodeObject(forKey: "country") as? String
         displayLocation = aDecoder.decodeObject(forKey: "display_location") as? String
         extendedAddress = aDecoder.decodeObject(forKey: "extended_address") as? String
         hasUpcomingEvents = aDecoder.decodeObject(forKey: "has_upcoming_events") as? Bool
         id = aDecoder.decodeObject(forKey: "id") as? Int
         links = aDecoder.decodeObject(forKey: "links") as? [String]
         location = aDecoder.decodeObject(forKey: "location") as? ClsEventListLocation
         metroCode = aDecoder.decodeObject(forKey: "metro_code") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         nameV2 = aDecoder.decodeObject(forKey: "name_v2") as? String
         numUpcomingEvents = aDecoder.decodeObject(forKey: "num_upcoming_events") as? Int
         popularity = aDecoder.decodeObject(forKey: "popularity") as? Int
         postalCode = aDecoder.decodeObject(forKey: "postal_code") as? String
         score = aDecoder.decodeObject(forKey: "score") as? Float
         slug = aDecoder.decodeObject(forKey: "slug") as? String
         state = aDecoder.decodeObject(forKey: "state") as? String
         timezone = aDecoder.decodeObject(forKey: "timezone") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if accessMethod != nil{
			aCoder.encode(accessMethod, forKey: "access_method")
		}
		if address != nil{
			aCoder.encode(address, forKey: "address")
		}
		if capacity != nil{
			aCoder.encode(capacity, forKey: "capacity")
		}
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if country != nil{
			aCoder.encode(country, forKey: "country")
		}
		if displayLocation != nil{
			aCoder.encode(displayLocation, forKey: "display_location")
		}
		if extendedAddress != nil{
			aCoder.encode(extendedAddress, forKey: "extended_address")
		}
		if hasUpcomingEvents != nil{
			aCoder.encode(hasUpcomingEvents, forKey: "has_upcoming_events")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if links != nil{
			aCoder.encode(links, forKey: "links")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}
		if metroCode != nil{
			aCoder.encode(metroCode, forKey: "metro_code")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if nameV2 != nil{
			aCoder.encode(nameV2, forKey: "name_v2")
		}
		if numUpcomingEvents != nil{
			aCoder.encode(numUpcomingEvents, forKey: "num_upcoming_events")
		}
		if popularity != nil{
			aCoder.encode(popularity, forKey: "popularity")
		}
		if postalCode != nil{
			aCoder.encode(postalCode, forKey: "postal_code")
		}
		if score != nil{
			aCoder.encode(score, forKey: "score")
		}
		if slug != nil{
			aCoder.encode(slug, forKey: "slug")
		}
		if state != nil{
			aCoder.encode(state, forKey: "state")
		}
		if timezone != nil{
			aCoder.encode(timezone, forKey: "timezone")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}
