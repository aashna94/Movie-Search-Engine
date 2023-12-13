//
//  SearchWebServiceProviding.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

typealias SearchWebServiceCompletionHandler = (_ response: SearchSuccessResponse?, _ error: SearchError?) -> ()

protocol SearchWebServiceProviding {
    
    func fetchSearchResult(forQueryString queryString: String, completionHandler: @escaping SearchWebServiceCompletionHandler)
    func cancelAllPreviousSearchRequests()
}
