//
//  SearchWebServiceProviderTests.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import XCTest
@testable import MovieApp

class SearchWebServiceProviderTests: XCTestCase {
    let mockValidRequestProvider = MockValidSearchRequestProvider()
    let mockErrorRequestProvider_NoMovieFound = MockErrorSearchRequestProvider_NoMovieFound()
    let mockErrorRequestProvider_TooManyResults = MockErrorSearchRequestProvider_TooManyResults()
    let mockInvalidRequestProvider = MockInvalidSearchRequestProvider()
    var webServiceProvider: SearchWebServiceProviding!
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
        webServiceProvider = nil
    }
    
    func testWithValidRequest() {
        let expectation = expectation(description: "downloading data")
        webServiceProvider = SearchWebServiceProvider(requestProvider: mockValidRequestProvider, queryStringUpdater: nil)
        webServiceProvider.fetchSearchResult(forQueryString: "") { response, error in
            expectation.fulfill()
            XCTAssertNotNil(response)
            XCTAssertNil(error)
        }
        waitForExpectations(timeout: 3)
    }
    
    func testWithErrorRequest_NoMovieFound() {
        let expectation = expectation(description: "downloading data")
        webServiceProvider = SearchWebServiceProvider(requestProvider: mockErrorRequestProvider_NoMovieFound, queryStringUpdater: nil)
        webServiceProvider.fetchSearchResult(forQueryString: "") { response, error in
            expectation.fulfill()
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            XCTAssertEqual(error, .movieNotFound)
        }
        waitForExpectations(timeout: 3)
    }
    
    
    func testWithErrorRequest_TooManyResults() {
        let expectation = expectation(description: "downloading data")
        webServiceProvider = SearchWebServiceProvider(requestProvider: mockErrorRequestProvider_TooManyResults, queryStringUpdater: nil)
        webServiceProvider.fetchSearchResult(forQueryString: "") { response, error in
            expectation.fulfill()
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            XCTAssertEqual(error, .tooManyResults)
        }
        waitForExpectations(timeout: 3)
    }
    
    
    func testWithInvalidRequest() {
        let expectation = expectation(description: "downloading data")
        webServiceProvider = SearchWebServiceProvider(requestProvider: mockInvalidRequestProvider, queryStringUpdater: nil)
        webServiceProvider.fetchSearchResult(forQueryString: "") { response, error in
            expectation.fulfill()
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            XCTAssertEqual(error, .other)
        }
        waitForExpectations(timeout: 3)
    }
}
