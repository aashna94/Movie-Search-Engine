//
//  SearchResponseTests.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import XCTest
@testable import MovieApp

class SearchResponseTests: XCTestCase {
    
    let invalidResponseJson =
    """
    {"Serch":[],"totalResults":"137","Response":"True"}
    """
    
    func testValidResponseInitialization() {
        guard let data = mockSuccessResponseTenResults.data(using: .utf8),
            let responseModel = try? JSONDecoder().decode(SearchSuccessResponse.self, from: data) else {
            XCTAssertThrowsError("Response model not initialized")
            return
        }
        XCTAssertEqual(responseModel.results.count, 10)
    }
    
    
    func testInvalidResponseInitialization() {
        if let data = invalidResponseJson.data(using: .utf8),
            let _ = try? JSONDecoder().decode(SearchSuccessResponse.self, from: data) {
            XCTAssertThrowsError("Response model should not initialized")
        }
        
        let expectation = expectation(description: "downloading data")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 2)
    }
    
    
    func testValidResponseValues() {
        guard let data = mockSuccessResponseTenResults.data(using: .utf8),
            let responseModel = try? JSONDecoder().decode(SearchSuccessResponse.self, from: data) else {
            XCTAssertThrowsError("Response model not initialized")
            return
        }
        
        let movie = responseModel.results[0]
        XCTAssertEqual(movie.title, "The Avengers")
        XCTAssertEqual(movie.year, "2012")
        XCTAssertEqual(movie.imdbId, "tt0848228")
        XCTAssertEqual(movie.posterUrl, "https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg")
        XCTAssertEqual(movie.type, "movie")
        XCTAssertNil(movie.genre)
        XCTAssertNil(movie.imdbRating)
        XCTAssertNil(movie.plot)
        XCTAssertNil(movie.boxOfficeEarnings)
    }
}
