//
//  DetailsWebServiceProvider.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

class DetailsWebServiceProvider: WebServiceProvider, DetailsDataProviding {
    let requestProvider: RequestProviding
    
    init(requestProvider: RequestProviding) {
        self.requestProvider = requestProvider
    }
    
    func fetchDetails(forImdbId imdbId: String, completionHandler: @escaping DetailsDataServiceCompletionHandler) {
        fetchData(requestProvider: requestProvider) { data, response, error in
            DispatchQueue.main.async {
                guard let data else {
                    completionHandler(nil, SearchError.other)
                    return
                }
                
                guard let successResponseModel = try? JSONDecoder().decode(Movie.self, from: data) else {
                    guard let failureResponseModel = try? JSONDecoder().decode(FailureResponse.self, from: data) else {
                        completionHandler(nil, SearchError.other)
                        return
                    }
                    if failureResponseModel.isInvalidImdbId {
                        completionHandler(nil, SearchError.movieNotFound)
                        return
                    }
                    completionHandler(nil, SearchError.other)
                    return
                }
                completionHandler(successResponseModel, nil)
            }
        }
    }
}
