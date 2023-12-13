//
//  SearchViewModelTests.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import XCTest
@testable import MovieApp

class SearchViewModelTests: XCTestCase {
    var viewModel: SearchViewModel!
    
    override func setUpWithError() throws {
        viewModel = SearchViewModel(searchWebServiceProvider: MockSearchWebServiceProvider(), imageServiceProvider: MockSuccessImageServiceProvider())
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testSearchWithEmptyQueryString() {
        var state: SearchState?
        viewModel.searchStateDidUpdate = { newState in
            state = newState
        }
        let refreshUiExpectation = expectation(description: "downloading data and refreshing UI")
        viewModel.refreshListUI = {
            
            refreshUiExpectation.fulfill()
        }
        viewModel.fetchMovieSearchResults(queryString: "")
        waitForExpectations(timeout: 3)
        
        XCTAssertEqual(viewModel.getCurrentSearchQueryString(), "")
        XCTAssertEqual(viewModel.numberOfSearchItems(), 0)
        XCTAssertNil(viewModel.searchItem(atIndex: 0))
        XCTAssertEqual(state, .empty)
    }
    
    func testSearchWithValidQueryStringSuccess() {
        let refreshUiExpectation = expectation(description: "downloading data and refreshing UI")
        viewModel.refreshListUI = {
            refreshUiExpectation.fulfill()
        }
        var state: SearchState?
        viewModel.searchStateDidUpdate = { newState in
            state = newState
        }
        viewModel.fetchMovieSearchResults(queryString: "Spiderman")
        waitForExpectations(timeout: 3)
        XCTAssertEqual(viewModel.getCurrentSearchQueryString(), "Spiderman")
        XCTAssertEqual(viewModel.numberOfSearchItems(), 10)
        XCTAssertNotNil(viewModel.searchItem(atIndex: 0))
        XCTAssertEqual(state, .data)
    }
    
    func testSearchWithValidQueryStringFailure() {
        let refreshUiExpectation = expectation(description: "downloading data and refreshing UI")
        viewModel.refreshListUI = {
            refreshUiExpectation.fulfill()
        }
        var state: SearchState?
        viewModel.searchStateDidUpdate = { newState in
            state = newState
        }
        (viewModel.searchWebServiceProvider as! MockSearchWebServiceProvider).isSuccessResponse = false
        viewModel.fetchMovieSearchResults(queryString: "XCTYQ")
        waitForExpectations(timeout: 3)
        XCTAssertEqual(viewModel.getCurrentSearchQueryString(), "XCTYQ")
        XCTAssertEqual(viewModel.numberOfSearchItems(), 0)
        XCTAssertNil(viewModel.searchItem(atIndex: 0))
        XCTAssertEqual(state, .error("XCTYQ", .other))
    }
}
