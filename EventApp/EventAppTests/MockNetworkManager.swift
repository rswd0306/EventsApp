//
//  MockNetworkManager.swift
//  EventAppTests

import Foundation
@testable import EventApp

class MockNetworkManager: NetworkService {
    var isErrorExists = false
    
    init(isErrorExists: Bool = false) {
        self.isErrorExists = isErrorExists
    }
    
    func getEventSearchList(endpoint: EventEndpoint, onSuccess: @escaping (ClsEventModel) -> Void, onFailure: @escaping (Error) -> Void) {
        if !isErrorExists {
            if let path = Bundle.main.path(forResource: "GET-SearchResultResponse", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        let model = ClsEventModel(fromDictionary: json as NSDictionary)
                        onSuccess(model)
                    }
                } catch {
                    // handle error
                    onFailure(NSError(domain: "Search event list api error", code: 100, userInfo: nil))
                }
            } else {
                onFailure(NSError(domain: "Sample data doesn't exist", code: 101, userInfo: nil))
            }
        } else {
            onFailure(NSError(domain: "Search event list api error", code: 100, userInfo: nil))
        }
    }
}
