//
//  MockDetailsWebServiceProvider.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import Foundation
@testable import MovieApp

class MockDetailsWebServiceProvider: DetailsDataProviding {
    
    
    var isSuccessResponse = true
    
    func fetchDetails(forImdbId imdbId: String, completionHandler: @escaping DetailsDataServiceCompletionHandler) {
        
        let json = self.isSuccessResponse ? mockSuccessDetailsResponse : mockFailureDetailsResponse
        
        guard let data = json.data(using: .utf8),
              let responseModel = try? JSONDecoder().decode(Movie.self, from: data) else {
            
            completionHandler(nil, SearchError.other)
            return
        }
        
        completionHandler(responseModel, nil)
    }
}
