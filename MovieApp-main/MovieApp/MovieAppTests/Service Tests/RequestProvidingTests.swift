//
//  RequestProvidingTests.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import XCTest
@testable import MovieApp

class RequestProvidingTests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    
    func testUrlRequestValues() {
        
        let requestProvider: RequestProviding = MockValidSearchRequestProvider()
        
        let request = requestProvider.urlRequest
        
        XCTAssertEqual(request?.url?.absoluteString, "https://www.omdbapi.com/?apiKey=4bbf63b&s=Avengers&plot=full")
        
        XCTAssertEqual(request?.httpBody, nil)
        
        XCTAssertEqual(request?.allHTTPHeaderFields, [:])
        
        XCTAssertEqual(request?.httpMethod, "GET")
        
        XCTAssertEqual(request?.timeoutInterval, 5.0)
    }
}

