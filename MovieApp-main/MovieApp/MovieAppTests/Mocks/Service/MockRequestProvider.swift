//
//  MockRequestProvider.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import Foundation
@testable import MovieApp

class MockValidSearchRequestProvider: RequestProviding {
    
    var urlString: String = "https://www.omdbapi.com/?apiKey=4bbf63b&s=Avengers&plot=full"
    
    var httpRequestMethod: HTTPRequestMethod = .GET
    
    var body: [String: AnyObject]? = nil
    
    var headers: [String: String]? =  nil
}


class MockErrorSearchRequestProvider_TooManyResults: RequestProviding {
    
    var urlString: String = "https://www.omdbapi.com/?apiKey=4bbf63b&s=The&plot=full"
    
    var httpRequestMethod: HTTPRequestMethod = .GET
    
    var body: [String: AnyObject]? = nil
    
    var headers: [String: String]? =  nil
}


class MockErrorSearchRequestProvider_NoMovieFound: RequestProviding {
    
    var urlString: String = "https://www.omdbapi.com/?apiKey=4bbf63b&s=ZXWQLF&plot=full"
    
    var httpRequestMethod: HTTPRequestMethod = .GET
    
    var body: [String: AnyObject]? = nil
    
    var headers: [String: String]? =  nil
}


class MockInvalidSearchRequestProvider: RequestProviding {
    
    var urlString: String = "https://www.ssssssssss.com"
    
    var httpRequestMethod: HTTPRequestMethod = .GET
    
    var body: [String: AnyObject]? = nil
    
    var headers: [String: String]? =  nil
}


class MockValidDetailsRequestProvider: RequestProviding {
    
    var urlString: String = "https://www.omdbapi.com/?apiKey=4bbf63b&i=tt0419887&plot=full"
    
    var httpRequestMethod: HTTPRequestMethod = .GET
    
    var body: [String: AnyObject]? = nil
    
    var headers: [String: String]? =  nil
}


class MockErrorDetailsRequestProvider_NoMovieFound: RequestProviding {
    
    var urlString: String = "https://www.omdbapi.com/?apiKey=4bbf63b&i=tt0419880011&plot=full"
    
    var httpRequestMethod: HTTPRequestMethod = .GET
    
    var body: [String: AnyObject]? = nil
    
    var headers: [String: String]? =  nil
}


class MockInvalidDetailsRequestProvider: RequestProviding {
    
    var urlString: String = "https://www.ssssssssss.com"
    
    var httpRequestMethod: HTTPRequestMethod = .GET
    
    var body: [String: AnyObject]? = nil
    
    var headers: [String: String]? =  nil
}


