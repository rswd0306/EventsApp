//
//	ClsEventListStat.swift
//  EventApp



import Foundation


class ClsEventListStat : NSObject, NSCoding{

	var eventCount : Int!
	var averagePrice : String!
	var dqBucketCounts : String!
	var highestPrice : String!
	var listingCount : String!
	var lowestPrice : String!
	var lowestPriceGoodDeals : String!
	var lowestSgBasePrice : String!
	var lowestSgBasePriceGoodDeals : String!
	var medianPrice : String!
	var visibleListingCount : String!


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
		eventCount = dictionary["event_count"] as? Int == nil ? 0 : dictionary["event_count"] as? Int
		averagePrice = dictionary["average_price"] as? String == nil ? "" : dictionary["average_price"] as? String
		dqBucketCounts = dictionary["dq_bucket_counts"] as? String == nil ? "" : dictionary["dq_bucket_counts"] as? String
		highestPrice = dictionary["highest_price"] as? String == nil ? "" : dictionary["highest_price"] as? String
		listingCount = dictionary["listing_count"] as? String == nil ? "" : dictionary["listing_count"] as? String
		lowestPrice = dictionary["lowest_price"] as? String == nil ? "" : dictionary["lowest_price"] as? String
		lowestPriceGoodDeals = dictionary["lowest_price_good_deals"] as? String == nil ? "" : dictionary["lowest_price_good_deals"] as? String
		lowestSgBasePrice = dictionary["lowest_sg_base_price"] as? String == nil ? "" : dictionary["lowest_sg_base_price"] as? String
		lowestSgBasePriceGoodDeals = dictionary["lowest_sg_base_price_good_deals"] as? String == nil ? "" : dictionary["lowest_sg_base_price_good_deals"] as? String
		medianPrice = dictionary["median_price"] as? String == nil ? "" : dictionary["median_price"] as? String
		visibleListingCount = dictionary["visible_listing_count"] as? String == nil ? "" : dictionary["visible_listing_count"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if eventCount != nil{
			dictionary["event_count"] = eventCount
		}
		if averagePrice != nil{
			dictionary["average_price"] = averagePrice
		}
		if dqBucketCounts != nil{
			dictionary["dq_bucket_counts"] = dqBucketCounts
		}
		if highestPrice != nil{
			dictionary["highest_price"] = highestPrice
		}
		if listingCount != nil{
			dictionary["listing_count"] = listingCount
		}
		if lowestPrice != nil{
			dictionary["lowest_price"] = lowestPrice
		}
		if lowestPriceGoodDeals != nil{
			dictionary["lowest_price_good_deals"] = lowestPriceGoodDeals
		}
		if lowestSgBasePrice != nil{
			dictionary["lowest_sg_base_price"] = lowestSgBasePrice
		}
		if lowestSgBasePriceGoodDeals != nil{
			dictionary["lowest_sg_base_price_good_deals"] = lowestSgBasePriceGoodDeals
		}
		if medianPrice != nil{
			dictionary["median_price"] = medianPrice
		}
		if visibleListingCount != nil{
			dictionary["visible_listing_count"] = visibleListingCount
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         eventCount = aDecoder.decodeObject(forKey: "event_count") as? Int
         averagePrice = aDecoder.decodeObject(forKey: "average_price") as? String
         dqBucketCounts = aDecoder.decodeObject(forKey: "dq_bucket_counts") as? String
         highestPrice = aDecoder.decodeObject(forKey: "highest_price") as? String
         listingCount = aDecoder.decodeObject(forKey: "listing_count") as? String
         lowestPrice = aDecoder.decodeObject(forKey: "lowest_price") as? String
         lowestPriceGoodDeals = aDecoder.decodeObject(forKey: "lowest_price_good_deals") as? String
         lowestSgBasePrice = aDecoder.decodeObject(forKey: "lowest_sg_base_price") as? String
         lowestSgBasePriceGoodDeals = aDecoder.decodeObject(forKey: "lowest_sg_base_price_good_deals") as? String
         medianPrice = aDecoder.decodeObject(forKey: "median_price") as? String
         visibleListingCount = aDecoder.decodeObject(forKey: "visible_listing_count") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if eventCount != nil{
			aCoder.encode(eventCount, forKey: "event_count")
		}
		if averagePrice != nil{
			aCoder.encode(averagePrice, forKey: "average_price")
		}
		if dqBucketCounts != nil{
			aCoder.encode(dqBucketCounts, forKey: "dq_bucket_counts")
		}
		if highestPrice != nil{
			aCoder.encode(highestPrice, forKey: "highest_price")
		}
		if listingCount != nil{
			aCoder.encode(listingCount, forKey: "listing_count")
		}
		if lowestPrice != nil{
			aCoder.encode(lowestPrice, forKey: "lowest_price")
		}
		if lowestPriceGoodDeals != nil{
			aCoder.encode(lowestPriceGoodDeals, forKey: "lowest_price_good_deals")
		}
		if lowestSgBasePrice != nil{
			aCoder.encode(lowestSgBasePrice, forKey: "lowest_sg_base_price")
		}
		if lowestSgBasePriceGoodDeals != nil{
			aCoder.encode(lowestSgBasePriceGoodDeals, forKey: "lowest_sg_base_price_good_deals")
		}
		if medianPrice != nil{
			aCoder.encode(medianPrice, forKey: "median_price")
		}
		if visibleListingCount != nil{
			aCoder.encode(visibleListingCount, forKey: "visible_listing_count")
		}

	}

}
