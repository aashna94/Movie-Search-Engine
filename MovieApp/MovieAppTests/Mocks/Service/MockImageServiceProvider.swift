//
//  MockImageServiceProvider.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import Foundation
import UIKit
@testable import MovieApp

extension UIColor {
    
    func image(_ size: CGSize = CGSize(width: 20, height: 20)) -> UIImage {
        
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            
            self.setFill()
            
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}


class MockSuccessImageServiceProvider: UIImageView, ImageServiceProviding {
    
    func downloadImageFor(_ urlString: String, completion: @escaping MovieApp.ImageServiceCompletionHandler) {
        self.image = UIColor.red.image()
        completion()
    }
    
    func loadImageFor(_ urlString: String, completion: @escaping MovieApp.ImageServiceCompletionHandler) {
        self.image = UIColor.red.image()
        completion()
    }
    
}
