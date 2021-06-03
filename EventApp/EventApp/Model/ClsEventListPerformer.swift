//
//	ClsEventListPerformer.swift
//  EventApp



import Foundation


class ClsEventListPerformer : NSObject, NSCoding{

	var colors : String!
	var divisions : String!
	var genres : [ClsEventListGenre]!
	var hasUpcomingEvents : Bool!
	var homeVenueId : String!
	var id : Int!
	var image : String!
	var imageAttribution : String!
	var imageLicense : String!
	var images : ClsEventListImage!
	var location : String!
	var name : String!
	var numUpcomingEvents : Int!
	var popularity : Int!
	var primary : Bool!
	var score : Float!
	var shortName : String!
	var slug : String!
	var stats : ClsEventListStat!
	var taxonomies : [ClsEventListTaxonomy]!
	var type : String!
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
		colors = dictionary["colors"] as? String == nil ? "" : dictionary["colors"] as? String
		divisions = dictionary["divisions"] as? String == nil ? "" : dictionary["divisions"] as? String
		genres = [ClsEventListGenre]()
		if let genresArray = dictionary["genres"] as? [NSDictionary]{
			for dic in genresArray{
				let value = ClsEventListGenre(fromDictionary: dic)
				genres.append(value)
			}
		}
		hasUpcomingEvents = dictionary["has_upcoming_events"] as? Bool == nil ? false : dictionary["has_upcoming_events"] as? Bool
		homeVenueId = dictionary["home_venue_id"] as? String == nil ? "" : dictionary["home_venue_id"] as? String
		id = dictionary["id"] as? Int == nil ? 0 : dictionary["id"] as? Int
		image = dictionary["image"] as? String == nil ? "" : dictionary["image"] as? String
		imageAttribution = dictionary["image_attribution"] as? String == nil ? "" : dictionary["image_attribution"] as? String
		imageLicense = dictionary["image_license"] as? String == nil ? "" : dictionary["image_license"] as? String
		if let imagesData = dictionary["images"] as? NSDictionary{
			images = ClsEventListImage(fromDictionary: imagesData)
		}
		else
		{
			images = ClsEventListImage(fromDictionary: NSDictionary.init())
		}
		location = dictionary["location"] as? String == nil ? "" : dictionary["location"] as? String
		name = dictionary["name"] as? String == nil ? "" : dictionary["name"] as? String
		numUpcomingEvents = dictionary["num_upcoming_events"] as? Int == nil ? 0 : dictionary["num_upcoming_events"] as? Int
		popularity = dictionary["popularity"] as? Int == nil ? 0 : dictionary["popularity"] as? Int
		primary = dictionary["primary"] as? Bool == nil ? false : dictionary["primary"] as? Bool
		score = dictionary["score"] as? Float == nil ? 0 : dictionary["score"] as? Float
		shortName = dictionary["short_name"] as? String == nil ? "" : dictionary["short_name"] as? String
		slug = dictionary["slug"] as? String == nil ? "" : dictionary["slug"] as? String
		if let statsData = dictionary["stats"] as? NSDictionary{
			stats = ClsEventListStat(fromDictionary: statsData)
		}
		else
		{
			stats = ClsEventListStat(fromDictionary: NSDictionary.init())
		}
		taxonomies = [ClsEventListTaxonomy]()
		if let taxonomiesArray = dictionary["taxonomies"] as? [NSDictionary]{
			for dic in taxonomiesArray{
				let value = ClsEventListTaxonomy(fromDictionary: dic)
				taxonomies.append(value)
			}
		}
		type = dictionary["type"] as? String == nil ? "" : dictionary["type"] as? String
		url = dictionary["url"] as? String == nil ? "" : dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if colors != nil{
			dictionary["colors"] = colors
		}
		if divisions != nil{
			dictionary["divisions"] = divisions
		}
		if genres != nil{
			var dictionaryElements = [NSDictionary]()
			for genresElement in genres {
				dictionaryElements.append(genresElement.toDictionary())
			}
			dictionary["genres"] = dictionaryElements
		}
		if hasUpcomingEvents != nil{
			dictionary["has_upcoming_events"] = hasUpcomingEvents
		}
		if homeVenueId != nil{
			dictionary["home_venue_id"] = homeVenueId
		}
		if id != nil{
			dictionary["id"] = id
		}
		if image != nil{
			dictionary["image"] = image
		}
		if imageAttribution != nil{
			dictionary["image_attribution"] = imageAttribution
		}
		if imageLicense != nil{
			dictionary["image_license"] = imageLicense
		}
		if images != nil{
			dictionary["images"] = images.toDictionary()
		}
		if location != nil{
			dictionary["location"] = location
		}
		if name != nil{
			dictionary["name"] = name
		}
		if numUpcomingEvents != nil{
			dictionary["num_upcoming_events"] = numUpcomingEvents
		}
		if popularity != nil{
			dictionary["popularity"] = popularity
		}
		if primary != nil{
			dictionary["primary"] = primary
		}
		if score != nil{
			dictionary["score"] = score
		}
		if shortName != nil{
			dictionary["short_name"] = shortName
		}
		if slug != nil{
			dictionary["slug"] = slug
		}
		if stats != nil{
			dictionary["stats"] = stats.toDictionary()
		}
		if taxonomies != nil{
			var dictionaryElements = [NSDictionary]()
			for taxonomiesElement in taxonomies {
				dictionaryElements.append(taxonomiesElement.toDictionary())
			}
			dictionary["taxonomies"] = dictionaryElements
		}
		if type != nil{
			dictionary["type"] = type
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
         colors = aDecoder.decodeObject(forKey: "colors") as? String
         divisions = aDecoder.decodeObject(forKey: "divisions") as? String
         genres = aDecoder.decodeObject(forKey: "genres") as? [ClsEventListGenre]
         hasUpcomingEvents = aDecoder.decodeObject(forKey: "has_upcoming_events") as? Bool
         homeVenueId = aDecoder.decodeObject(forKey: "home_venue_id") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         image = aDecoder.decodeObject(forKey: "image") as? String
         imageAttribution = aDecoder.decodeObject(forKey: "image_attribution") as? String
         imageLicense = aDecoder.decodeObject(forKey: "image_license") as? String
         images = aDecoder.decodeObject(forKey: "images") as? ClsEventListImage
         location = aDecoder.decodeObject(forKey: "location") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         numUpcomingEvents = aDecoder.decodeObject(forKey: "num_upcoming_events") as? Int
         popularity = aDecoder.decodeObject(forKey: "popularity") as? Int
         primary = aDecoder.decodeObject(forKey: "primary") as? Bool
         score = aDecoder.decodeObject(forKey: "score") as? Float
         shortName = aDecoder.decodeObject(forKey: "short_name") as? String
         slug = aDecoder.decodeObject(forKey: "slug") as? String
         stats = aDecoder.decodeObject(forKey: "stats") as? ClsEventListStat
         taxonomies = aDecoder.decodeObject(forKey: "taxonomies") as? [ClsEventListTaxonomy]
         type = aDecoder.decodeObject(forKey: "type") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if colors != nil{
			aCoder.encode(colors, forKey: "colors")
		}
		if divisions != nil{
			aCoder.encode(divisions, forKey: "divisions")
		}
		if genres != nil{
			aCoder.encode(genres, forKey: "genres")
		}
		if hasUpcomingEvents != nil{
			aCoder.encode(hasUpcomingEvents, forKey: "has_upcoming_events")
		}
		if homeVenueId != nil{
			aCoder.encode(homeVenueId, forKey: "home_venue_id")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if image != nil{
			aCoder.encode(image, forKey: "image")
		}
		if imageAttribution != nil{
			aCoder.encode(imageAttribution, forKey: "image_attribution")
		}
		if imageLicense != nil{
			aCoder.encode(imageLicense, forKey: "image_license")
		}
		if images != nil{
			aCoder.encode(images, forKey: "images")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if numUpcomingEvents != nil{
			aCoder.encode(numUpcomingEvents, forKey: "num_upcoming_events")
		}
		if popularity != nil{
			aCoder.encode(popularity, forKey: "popularity")
		}
		if primary != nil{
			aCoder.encode(primary, forKey: "primary")
		}
		if score != nil{
			aCoder.encode(score, forKey: "score")
		}
		if shortName != nil{
			aCoder.encode(shortName, forKey: "short_name")
		}
		if slug != nil{
			aCoder.encode(slug, forKey: "slug")
		}
		if stats != nil{
			aCoder.encode(stats, forKey: "stats")
		}
		if taxonomies != nil{
			aCoder.encode(taxonomies, forKey: "taxonomies")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}
