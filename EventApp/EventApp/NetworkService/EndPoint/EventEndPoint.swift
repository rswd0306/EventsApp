//
//  EventEndPoint.swift
//  EventApp

import Foundation

enum EventEndpoint {
    case getSearchList(searchKey: String, page :Int)
}

extension EventEndpoint {
    private struct APIConstants {
        static let baseURL = "https://api.seatgeek.com/2/events?client_id=MjE4OTU0NDF8MTYyMTAwNzUxNC4xNTc5ODU0"
        static let getMovieSearchList = "&q="
    }
    
    var baseURL: String {
        return APIConstants.baseURL
    }
    
    var query: String {
        return APIConstants.getMovieSearchList
    }
    
    var path: String {
        switch self {
        case .getSearchList(let searchKey, let page):
            return baseURL + query + searchKey + "&page=\(page)"
        }
    }
    
    var method: String {
        switch self {
        case .getSearchList:
            return "GET"
        }
    }
}
