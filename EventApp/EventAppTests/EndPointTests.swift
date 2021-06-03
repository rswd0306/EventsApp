//
//  EndPointTests.swift
//  EventAppTests


import XCTest
@testable import EventApp

class EndPointTests: XCTestCase {

    func testGetSearchListEndPoint() {
        
        // GIVEN
        let endpoint = EventEndpoint.getSearchList(searchKey: "someKey", page: 0)
        
        // THEN
        XCTAssertEqual(endpoint.baseURL, "https://api.seatgeek.com/2/events?client_id=MjE4OTU0NDF8MTYyMTAwNzUxNC4xNTc5ODU0")
        XCTAssertEqual(endpoint.path, "https://api.seatgeek.com/2/events?client_id=MjE4OTU0NDF8MTYyMTAwNzUxNC4xNTc5ODU0&q=someKey&page=0")
        XCTAssertEqual(endpoint.query, "&q=")
        XCTAssertEqual(endpoint.method, "GET")
    }
}
