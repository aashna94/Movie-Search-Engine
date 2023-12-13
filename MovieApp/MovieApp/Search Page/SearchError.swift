//
//  SearchError.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

enum SearchError: Error {
    case tooManyResults
    case movieNotFound
    case invalidUrl
    case invalidImdbId
    case other
    
    func getErrorDescription(forQueryString queryString: String) -> String {
        switch self {
        case .tooManyResults: return "Too many results for '\(queryString)'"
        case .movieNotFound: return "Movie not found for '\(queryString)'"
        case .invalidUrl: return "Invalid search request URL for '\(queryString)'"
        case .invalidImdbId: return "Invalid IMDB Id '\(queryString)'"
        case .other: return "Please try again. Some error occurred"
        }
    }
}
