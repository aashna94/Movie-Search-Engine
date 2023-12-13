//
//  WebServiceProvidingTests.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import XCTest
@testable import MovieApp

class WebServiceProvidingTests: XCTestCase {
    
    var webServiceProvider: WebServiceProvider!
    
    override func setUpWithError() throws {
        webServiceProvider = WebServiceProvider()
    }
    
    override func tearDownWithError() throws {
        webServiceProvider = nil
    }
    
    func testFetchDataForValidUrl() {
        let expectation = expectation(description: "downloading data")
        webServiceProvider.fetchData(requestProvider: MockValidSearchRequestProvider()) { data, response, error in
            expectation.fulfill()
            XCTAssertNotNil(data)
        }
        waitForExpectations(timeout: 3)
    }
    
    func testFetchDataForInvalidUrl() {
        let expectation = expectation(description: "downloading data")
        webServiceProvider.fetchData(requestProvider: MockInvalidSearchRequestProvider()) { data, response, error in
            expectation.fulfill()
            XCTAssertNil(data)
        }
        waitForExpectations(timeout: 3)
    }
}
