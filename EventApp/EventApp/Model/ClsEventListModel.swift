//
//	ClsEventListModel.swift
//  EventApp



import Foundation


class ClsEventListModel : NSObject, NSCoding{

	var accessMethod : String!
	var announceDate : String!
	var announcements : ClsEventListAnnouncement!
	var conditional : Bool!
	var createdAt : String!
	var dateTbd : Bool!
	var datetimeLocal : String!
	var datetimeTbd : Bool!
	var datetimeUtc : String!
	var descriptionField : String!
	var domainInformation : [String]!
	var enddatetimeUtc : String!
	var eventPromotion : String!
	var generalAdmission : Bool!
	var id : Int!
	var isOpen : Bool!
	var links : [String]!
	var performers : [ClsEventListPerformer]!
	var popularity : Float!
	var score : Float!
	var shortTitle : String!
	var stats : ClsEventListStat!
	var status : String!
	var taxonomies : [ClsEventListTaxonomy]!
	var themes : [String]!
	var timeTbd : Bool!
	var title : String!
	var type : String!
	var url : String!
	var venue : ClsEventListVenue!
	var visibleUntilUtc : String!


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
		announceDate = dictionary["announce_date"] as? String == nil ? "" : dictionary["announce_date"] as? String
		if let announcementsData = dictionary["announcements"] as? NSDictionary{
			announcements = ClsEventListAnnouncement(fromDictionary: announcementsData)
		}
		else
		{
			announcements = ClsEventListAnnouncement(fromDictionary: NSDictionary.init())
		}
		conditional = dictionary["conditional"] as? Bool == nil ? false : dictionary["conditional"] as? Bool
		createdAt = dictionary["created_at"] as? String == nil ? "" : dictionary["created_at"] as? String
		dateTbd = dictionary["date_tbd"] as? Bool == nil ? false : dictionary["date_tbd"] as? Bool
		datetimeLocal = dictionary["datetime_local"] as? String == nil ? "" : dictionary["datetime_local"] as? String
		datetimeTbd = dictionary["datetime_tbd"] as? Bool == nil ? false : dictionary["datetime_tbd"] as? Bool
		datetimeUtc = dictionary["datetime_utc"] as? String == nil ? "" : dictionary["datetime_utc"] as? String
		descriptionField = dictionary["description"] as? String == nil ? "" : dictionary["description"] as? String
		domainInformation = dictionary["domain_information"] as? [String] == nil ? [] : dictionary["domain_information"] as? [String]
		enddatetimeUtc = dictionary["enddatetime_utc"] as? String == nil ? "" : dictionary["enddatetime_utc"] as? String
		eventPromotion = dictionary["event_promotion"] as? String == nil ? "" : dictionary["event_promotion"] as? String
		generalAdmission = dictionary["general_admission"] as? Bool == nil ? false : dictionary["general_admission"] as? Bool
		id = dictionary["id"] as? Int == nil ? 0 : dictionary["id"] as? Int
		isOpen = dictionary["is_open"] as? Bool == nil ? false : dictionary["is_open"] as? Bool
		links = dictionary["links"] as? [String] == nil ? [] : dictionary["links"] as? [String]
		performers = [ClsEventListPerformer]()
		if let performersArray = dictionary["performers"] as? [NSDictionary]{
			for dic in performersArray{
				let value = ClsEventListPerformer(fromDictionary: dic)
				performers.append(value)
			}
		}
		popularity = dictionary["popularity"] as? Float == nil ? 0 : dictionary["popularity"] as? Float
		score = dictionary["score"] as? Float == nil ? 0 : dictionary["score"] as? Float
		shortTitle = dictionary["short_title"] as? String == nil ? "" : dictionary["short_title"] as? String
		if let statsData = dictionary["stats"] as? NSDictionary{
			stats = ClsEventListStat(fromDictionary: statsData)
		}
		else
		{
			stats = ClsEventListStat(fromDictionary: NSDictionary.init())
		}
		status = dictionary["status"] as? String == nil ? "" : dictionary["status"] as? String
		taxonomies = [ClsEventListTaxonomy]()
		if let taxonomiesArray = dictionary["taxonomies"] as? [NSDictionary]{
			for dic in taxonomiesArray{
				let value = ClsEventListTaxonomy(fromDictionary: dic)
				taxonomies.append(value)
			}
		}
		themes = dictionary["themes"] as? [String] == nil ? [] : dictionary["themes"] as? [String]
		timeTbd = dictionary["time_tbd"] as? Bool == nil ? false : dictionary["time_tbd"] as? Bool
		title = dictionary["title"] as? String == nil ? "" : dictionary["title"] as? String
		type = dictionary["type"] as? String == nil ? "" : dictionary["type"] as? String
		url = dictionary["url"] as? String == nil ? "" : dictionary["url"] as? String
		if let venueData = dictionary["venue"] as? NSDictionary{
			venue = ClsEventListVenue(fromDictionary: venueData)
		}
		else
		{
			venue = ClsEventListVenue(fromDictionary: NSDictionary.init())
		}
		visibleUntilUtc = dictionary["visible_until_utc"] as? String == nil ? "" : dictionary["visible_until_utc"] as? String
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
		if announceDate != nil{
			dictionary["announce_date"] = announceDate
		}
		if announcements != nil{
			dictionary["announcements"] = announcements.toDictionary()
		}
		if conditional != nil{
			dictionary["conditional"] = conditional
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if dateTbd != nil{
			dictionary["date_tbd"] = dateTbd
		}
		if datetimeLocal != nil{
			dictionary["datetime_local"] = datetimeLocal
		}
		if datetimeTbd != nil{
			dictionary["datetime_tbd"] = datetimeTbd
		}
		if datetimeUtc != nil{
			dictionary["datetime_utc"] = datetimeUtc
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if domainInformation != nil{
			dictionary["domain_information"] = domainInformation
		}
		if enddatetimeUtc != nil{
			dictionary["enddatetime_utc"] = enddatetimeUtc
		}
		if eventPromotion != nil{
			dictionary["event_promotion"] = eventPromotion
		}
		if generalAdmission != nil{
			dictionary["general_admission"] = generalAdmission
		}
		if id != nil{
			dictionary["id"] = id
		}
		if isOpen != nil{
			dictionary["is_open"] = isOpen
		}
		if links != nil{
			dictionary["links"] = links
		}
		if performers != nil{
			var dictionaryElements = [NSDictionary]()
			for performersElement in performers {
				dictionaryElements.append(performersElement.toDictionary())
			}
			dictionary["performers"] = dictionaryElements
		}
		if popularity != nil{
			dictionary["popularity"] = popularity
		}
		if score != nil{
			dictionary["score"] = score
		}
		if shortTitle != nil{
			dictionary["short_title"] = shortTitle
		}
		if stats != nil{
			dictionary["stats"] = stats.toDictionary()
		}
		if status != nil{
			dictionary["status"] = status
		}
		if taxonomies != nil{
			var dictionaryElements = [NSDictionary]()
			for taxonomiesElement in taxonomies {
				dictionaryElements.append(taxonomiesElement.toDictionary())
			}
			dictionary["taxonomies"] = dictionaryElements
		}
		if themes != nil{
			dictionary["themes"] = themes
		}
		if timeTbd != nil{
			dictionary["time_tbd"] = timeTbd
		}
		if title != nil{
			dictionary["title"] = title
		}
		if type != nil{
			dictionary["type"] = type
		}
		if url != nil{
			dictionary["url"] = url
		}
		if venue != nil{
			dictionary["venue"] = venue.toDictionary()
		}
		if visibleUntilUtc != nil{
			dictionary["visible_until_utc"] = visibleUntilUtc
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
         announceDate = aDecoder.decodeObject(forKey: "announce_date") as? String
         announcements = aDecoder.decodeObject(forKey: "announcements") as? ClsEventListAnnouncement
         conditional = aDecoder.decodeObject(forKey: "conditional") as? Bool
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         dateTbd = aDecoder.decodeObject(forKey: "date_tbd") as? Bool
         datetimeLocal = aDecoder.decodeObject(forKey: "datetime_local") as? String
         datetimeTbd = aDecoder.decodeObject(forKey: "datetime_tbd") as? Bool
         datetimeUtc = aDecoder.decodeObject(forKey: "datetime_utc") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         domainInformation = aDecoder.decodeObject(forKey: "domain_information") as? [String]
         enddatetimeUtc = aDecoder.decodeObject(forKey: "enddatetime_utc") as? String
         eventPromotion = aDecoder.decodeObject(forKey: "event_promotion") as? String
         generalAdmission = aDecoder.decodeObject(forKey: "general_admission") as? Bool
         id = aDecoder.decodeObject(forKey: "id") as? Int
         isOpen = aDecoder.decodeObject(forKey: "is_open") as? Bool
         links = aDecoder.decodeObject(forKey: "links") as? [String]
         performers = aDecoder.decodeObject(forKey: "performers") as? [ClsEventListPerformer]
         popularity = aDecoder.decodeObject(forKey: "popularity") as? Float
         score = aDecoder.decodeObject(forKey: "score") as? Float
         shortTitle = aDecoder.decodeObject(forKey: "short_title") as? String
         stats = aDecoder.decodeObject(forKey: "stats") as? ClsEventListStat
         status = aDecoder.decodeObject(forKey: "status") as? String
         taxonomies = aDecoder.decodeObject(forKey: "taxonomies") as? [ClsEventListTaxonomy]
         themes = aDecoder.decodeObject(forKey: "themes") as? [String]
         timeTbd = aDecoder.decodeObject(forKey: "time_tbd") as? Bool
         title = aDecoder.decodeObject(forKey: "title") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String
         venue = aDecoder.decodeObject(forKey: "venue") as? ClsEventListVenue
         visibleUntilUtc = aDecoder.decodeObject(forKey: "visible_until_utc") as? String

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
		if announceDate != nil{
			aCoder.encode(announceDate, forKey: "announce_date")
		}
		if announcements != nil{
			aCoder.encode(announcements, forKey: "announcements")
		}
		if conditional != nil{
			aCoder.encode(conditional, forKey: "conditional")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if dateTbd != nil{
			aCoder.encode(dateTbd, forKey: "date_tbd")
		}
		if datetimeLocal != nil{
			aCoder.encode(datetimeLocal, forKey: "datetime_local")
		}
		if datetimeTbd != nil{
			aCoder.encode(datetimeTbd, forKey: "datetime_tbd")
		}
		if datetimeUtc != nil{
			aCoder.encode(datetimeUtc, forKey: "datetime_utc")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if domainInformation != nil{
			aCoder.encode(domainInformation, forKey: "domain_information")
		}
		if enddatetimeUtc != nil{
			aCoder.encode(enddatetimeUtc, forKey: "enddatetime_utc")
		}
		if eventPromotion != nil{
			aCoder.encode(eventPromotion, forKey: "event_promotion")
		}
		if generalAdmission != nil{
			aCoder.encode(generalAdmission, forKey: "general_admission")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if isOpen != nil{
			aCoder.encode(isOpen, forKey: "is_open")
		}
		if links != nil{
			aCoder.encode(links, forKey: "links")
		}
		if performers != nil{
			aCoder.encode(performers, forKey: "performers")
		}
		if popularity != nil{
			aCoder.encode(popularity, forKey: "popularity")
		}
		if score != nil{
			aCoder.encode(score, forKey: "score")
		}
		if shortTitle != nil{
			aCoder.encode(shortTitle, forKey: "short_title")
		}
		if stats != nil{
			aCoder.encode(stats, forKey: "stats")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if taxonomies != nil{
			aCoder.encode(taxonomies, forKey: "taxonomies")
		}
		if themes != nil{
			aCoder.encode(themes, forKey: "themes")
		}
		if timeTbd != nil{
			aCoder.encode(timeTbd, forKey: "time_tbd")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
		if venue != nil{
			aCoder.encode(venue, forKey: "venue")
		}
		if visibleUntilUtc != nil{
			aCoder.encode(visibleUntilUtc, forKey: "visible_until_utc")
		}

	}

}
