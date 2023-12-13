//
//  RequestProviding.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

protocol RequestProviding {
    var urlString: String { get }
    var httpRequestMethod: HTTPRequestMethod { get }
    var body: [String: AnyObject]? { get }
    var headers: [String: String]? { get }
}

extension RequestProviding {
    
    var urlRequest: URLRequest? {
        guard let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return nil }
        guard let url = URL(string: urlString) else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpRequestMethod.rawValue
        if let body = body {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        
        if let headers = headers {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        urlRequest.timeoutInterval = 5.0
        return urlRequest
    }
}
