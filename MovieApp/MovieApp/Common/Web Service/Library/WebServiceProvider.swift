//
//  WebServiceProvider.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

typealias WebServiceCompletionHandler = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

class WebServiceProvider {
    
    final func fetchData(requestProvider: RequestProviding, completionHandler: @escaping WebServiceCompletionHandler) {
        guard let urlRequest = requestProvider.urlRequest else { return }
        WebServiceManager.fetchData(urlRequest: urlRequest) { data, response, error in
            completionHandler(data, response, error)
        }
    }
    
    final func cancelAllDataRequests() {
        WebServiceManager.cancelAll()
    }
}
