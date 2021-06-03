//
//  SearchResultResponseTests.swift
//  EventAppTests

import XCTest
@testable import EventApp

class SearchResultResponseTests: XCTestCase {

    var sut: HomeViewModel!
    let mockNetworkManager = MockNetworkManager()
    
    override func setUp()  {
        super.setUp()
        sut = HomeViewModel(networkManager: mockNetworkManager)
    }

    override func tearDown()  {
        sut = nil
        super.tearDown()
    }

    func testSearchListSuccessResponse() {
        // GIVEN
        let expectedDataCount = 10
        let expectedCreatedDate = "2021-04-29T16:01:19"
        let expectedShortTitle = "Lakeland Flying Tigers at Tampa Tarpons"
        let expectedUrl = "https://seatgeek.com/lakeland-flying-tigers-at-tampa-tarpons-tickets/minor-league-baseball/2021-06-02-6-30-pm/5393399"
        let expectedStatus = "normal"

        // WHEN
        sut.getSearchResult(for: "") { (data,error) in
            guard error == nil else {
                XCTFail("Expected data but found an error")
                return
            }
            
            // THEN
            XCTAssertFalse(data.isEmpty)
            XCTAssertEqual(data.count, expectedDataCount)
            XCTAssertEqual(data[0].shortTitle, expectedShortTitle)
            XCTAssertEqual(data[0].url, expectedUrl)
            XCTAssertEqual(data[0].status, expectedStatus)
            XCTAssertEqual(data[0].createdAt, expectedCreatedDate)
        }
    }
    
    func testSearchListFailureResponse() {
        mockNetworkManager.isErrorExists = true
        sut.getSearchResult(for: "") { (data,error) in
            guard error != nil else {
                XCTFail("Expected an error")
                return
            }
        }
    }
    
}
