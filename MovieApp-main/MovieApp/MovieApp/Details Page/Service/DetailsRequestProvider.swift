//
//  DetailsRequestProvider.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

class DetailsRequestProvider: RequestProviding {
    var urlString: String {
        "https://www.omdbapi.com/" + "?apiKey=4bbf63b" + "&i=\(imdbId)" + "&plot=full"
    }
    
    var httpRequestMethod: HTTPRequestMethod {
        .GET
    }
    
    let body: [String: AnyObject]? = nil
    let headers: [String: String]? = nil
    let imdbId: String
    
    init(imdbId: String) {
        self.imdbId = imdbId
    }
}
