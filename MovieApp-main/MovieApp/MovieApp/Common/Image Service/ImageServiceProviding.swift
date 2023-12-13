//
//  ImageServiceProviding.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import UIKit

typealias ImageServiceCompletionHandler = () -> Void

protocol ImageServiceProviding {
    func downloadImageFor(_ urlString: String, completion: @escaping ImageServiceCompletionHandler)
    func loadImageFor(_ urlString: String, completion: @escaping ImageServiceCompletionHandler)
}
