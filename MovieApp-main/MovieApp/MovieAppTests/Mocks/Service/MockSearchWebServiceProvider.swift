//
//  MockSearchWebServiceProvider.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import Foundation
@testable import MovieApp

class MockSearchWebServiceProvider: SearchWebServiceProviding {
    
    var isSearchInProgress = false
    
    var isSuccessResponse = true
    
    
    func fetchSearchResult(forQueryString queryString: String, completionHandler: @escaping SearchWebServiceCompletionHandler) {
        
        isSearchInProgress = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
            self.isSearchInProgress = false
            
            let json = self.isSuccessResponse ? mockSuccessResponseTenResults : mockFailureResponse
            
            guard let data = json.data(using: .utf8),
                  let responseModel = try? JSONDecoder().decode(SearchSuccessResponse.self, from: data) else {
                
                completionHandler(nil, SearchError.other)
                return
            }
            
            completionHandler(responseModel, nil)
        }
    }
    
    
    func cancelAllPreviousSearchRequests() {
        
        isSearchInProgress = false
    }
}
