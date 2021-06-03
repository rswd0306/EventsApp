//
//  APIManager.swift
//  EventApp



import UIKit

class APIManager: NetworkService {
    static let sharedInstance = APIManager()
    
    func getEventSearchList(endpoint: EventEndpoint, onSuccess: @escaping(ClsEventModel) -> Void, onFailure: @escaping(Error) -> Void){
        var url = endpoint.path
        url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let request: NSMutableURLRequest = NSMutableURLRequest(url: URL(string: url)!)
        request.httpMethod = endpoint.method
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            } else{
                
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: data ?? Data(), options: []) as? [String: Any] {
                        let model = ClsEventModel(fromDictionary: json as NSDictionary)
                        onSuccess(model)
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                    onFailure(error)
                }
            }
        })
        task.resume()
    }
}
