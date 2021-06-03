//
//  ImageLoader.swift
//  EventApp



import Foundation
import UIKit

class ImageLoadingWithCache {

    var imageCache = [String:UIImage]()

    func getImage(url: String, imageView: UIImageView, defaultImage: String) {
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        if let img = imageCache[url] {
            imageView.image = img
        } else {
            
            if (URL(string: url) == nil){
                DispatchQueue.main.async {
                    imageView.image = UIImage(named: defaultImage)
                }
            }else{
                let request: URLRequest = URLRequest(url: URL(string: url)!)

                let session = URLSession.shared
                let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
                    if error == nil && data != nil{
                        let image = UIImage(data: data!)
                        self.imageCache[url] = image
                        DispatchQueue.main.async {
                            imageView.image = image
                        }
                    }
                    else {
                        DispatchQueue.main.async {
                            imageView.image = UIImage(named: defaultImage)
                        }
                    }
                })
                task.resume()
            }
            
            
        }
    }
}
