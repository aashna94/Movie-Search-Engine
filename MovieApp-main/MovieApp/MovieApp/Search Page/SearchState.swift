//
//  SearchState.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

enum SearchState: Equatable {
    case empty
    case loading
    case data
    case error(String, SearchError)
    
    func getStateDescription() -> String {
        switch self {
        case .empty: return "Find movies using this awesome search engine!!!"
        case .loading: return "Searching...."
        case .data: return ""
        case .error(let queryString, let error): return "\(error.getErrorDescription(forQueryString: queryString))"
        }
    }
}
