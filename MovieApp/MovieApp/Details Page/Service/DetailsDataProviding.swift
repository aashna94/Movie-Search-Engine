//
//  DetailsDataProviding.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

typealias DetailsDataServiceCompletionHandler = (_ response: Movie?, _ error: SearchError?) -> ()

protocol DetailsDataProviding {
    func fetchDetails(forImdbId imdbId: String, completionHandler: @escaping DetailsDataServiceCompletionHandler)
}
