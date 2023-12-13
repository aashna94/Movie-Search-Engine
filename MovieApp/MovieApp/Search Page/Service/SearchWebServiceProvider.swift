//
//  SearchWebServiceProvider.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

class SearchWebServiceProvider: WebServiceProvider, SearchWebServiceProviding {
    
    let requestProvider: RequestProviding
    let queryStringUpdater: QueryStringUpdating?
    
    init(requestProvider: RequestProviding, queryStringUpdater: QueryStringUpdating?) {
        self.requestProvider = requestProvider
        self.queryStringUpdater = queryStringUpdater
    }
    
    func fetchSearchResult(forQueryString queryString: String, completionHandler: @escaping SearchWebServiceCompletionHandler) {
        queryStringUpdater?.setQueryString(value: queryString)
        fetchData(requestProvider: requestProvider) { data, response, error in
            DispatchQueue.main.async {
                guard let data else {
                    completionHandler(nil, SearchError.other)
                    return
                }
                
                guard let successResponseModel = try? JSONDecoder().decode(SearchSuccessResponse.self, from: data) else {
                    guard let failureResponseModel = try? JSONDecoder().decode(FailureResponse.self, from: data) else {
                        completionHandler(nil, SearchError.other)
                        return
                    }
                    
                    if failureResponseModel.isMovieNotFound {
                        completionHandler(nil, SearchError.movieNotFound)
                        return
                    }
                    
                    if failureResponseModel.isTooManyResults {
                        completionHandler(nil, SearchError.tooManyResults)
                        return
                    }
                    
                    completionHandler(nil, SearchError.other)
                    return
                }
                completionHandler(successResponseModel, nil)
            }
        }
    }
    
    func cancelAllPreviousSearchRequests() {
        cancelAllDataRequests()
    }
}
