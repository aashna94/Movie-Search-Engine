//
//  SearchRequestProvider.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

protocol QueryStringUpdating {
    func setQueryString(value: String)
}

class SearchRequestProvider: RequestProviding {
    
    var urlString: String {
        Constants.Url.MoviesBaseUrl + "?apiKey=\(Constants.Token.ApiKey)" + "&s=\(queryString)" + "&plot=full"
    }
    
    var httpRequestMethod: HTTPRequestMethod {
        .GET
    }
    
    let body: [String: AnyObject]? = nil
    let headers: [String: String]? = nil
    var queryString: String = ""
}

extension SearchRequestProvider: QueryStringUpdating {
    func setQueryString(value: String) {
        queryString = value
    }
}
