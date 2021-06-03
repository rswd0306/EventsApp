//
//  HomeViewModel.swift
//  EventApp

import Foundation

class HomeViewModel {
    
    let networkManager: NetworkService!
    private var arrEventList = [ClsEventListModel]()
    var page:Int = 1
    var totalPages = Int()
    
    init(networkManager: NetworkService = APIManager.sharedInstance) {
        self.networkManager = networkManager
    }
    
    func getSearchResult(for searchKey:String = "", completion: @escaping ((_ data: [ClsEventListModel], _ error: Error?) -> Void)) {
        networkManager.getEventSearchList(endpoint: .getSearchList(searchKey: searchKey, page: page)) { dictModel in
            DispatchQueue.main.async {
                if self.page == 1 {
                    self.arrEventList.removeAll()
                    self.totalPages = dictModel.meta.total
                }
                self.arrEventList += dictModel.events
                completion(self.arrEventList,nil)
            }
        } onFailure: { error in
            self.arrEventList.removeAll()
            completion([],NSError(domain: "Request failed on get search result", code: 100, userInfo: nil))
        }
    }
    
    func getNumberOfRows() -> Int {
        return arrEventList.count
    }
    
    func resetDataSource() {
        arrEventList.removeAll()
    }
    
    func getEventListDataSource() -> [ClsEventListModel] {
        return arrEventList
    }
    
    func getEventListDataSource(atIndex index: Int) -> ClsEventListModel? {
        guard arrEventList.indices.contains(index) else { return nil }
        return arrEventList[index]
    }
}
