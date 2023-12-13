//
//  ImageServiceProvider.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation
import UIKit

class ImageServiceProvider: UIImageView, ImageServiceProviding {
    
    static var cache: NSCache<NSString, AnyObject> = NSCache<NSString, AnyObject>()
    
    func loadImageFor(_ urlString: String, completion: @escaping ImageServiceCompletionHandler) {
        if let img = ImageServiceProvider.cache.object(forKey: urlString as NSString) as? UIImage {
            self.image = img
            completion()
        } else {
            downloadImageFor(urlString, completion: completion)
        }
    }
    
    func downloadImageFor(_ urlString: String, completion: @escaping ImageServiceCompletionHandler) {
        guard let url = URL(string: urlString) else {
            completion()
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let mimeType = httpResponse.mimeType,
                  mimeType.hasPrefix("image"),
                  let data, error == nil,
                  let image = UIImage(data: data) else {
                completion()
                return
            }
            ImageServiceProvider.cache.setObject(image, forKey: urlString as NSString)
            DispatchQueue.main.async {
                self.image = image
            }
            completion()
        }.resume()
    }
    
}
