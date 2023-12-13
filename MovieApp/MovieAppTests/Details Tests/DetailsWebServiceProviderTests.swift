//
//  DetailsWebServiceProviderTests.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import XCTest
@testable import MovieApp

class DetailsWebServiceProviderTests: XCTestCase {

    let mockValidRequestProvider = MockValidDetailsRequestProvider()
    let mockErrorRequestProvider_NoMovieFound = MockErrorDetailsRequestProvider_NoMovieFound()
    let mockInvalidRequestProvider = MockInvalidDetailsRequestProvider()
    var webServiceProvider: DetailsDataProviding!
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
        webServiceProvider = nil
    }
    
    func testWithValidRequest() {
        let expectation = expectation(description: "downloading data")
        webServiceProvider = DetailsWebServiceProvider(requestProvider: mockValidRequestProvider)
        webServiceProvider.fetchDetails(forImdbId: "") { response, error in
            expectation.fulfill()
            XCTAssertNotNil(response)
            XCTAssertNil(error)
        }
        waitForExpectations(timeout: 3)
    }
    
    func testWithErrorRequest_NoMovieFound() {
        let expectation = expectation(description: "downloading data")
        webServiceProvider = DetailsWebServiceProvider(requestProvider: mockErrorRequestProvider_NoMovieFound)
        webServiceProvider.fetchDetails(forImdbId: "") { response, error in
            expectation.fulfill()
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            XCTAssertEqual(error, .movieNotFound)
        }
        waitForExpectations(timeout: 3)
    }
    
    func testWithInvalidRequest() {
        let expectation = expectation(description: "downloading data")
        webServiceProvider = DetailsWebServiceProvider(requestProvider: mockInvalidRequestProvider)
        webServiceProvider.fetchDetails(forImdbId: "") { response, error in
            expectation.fulfill()
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            XCTAssertEqual(error, .other)
        }
        waitForExpectations(timeout: 3)
    }
}
