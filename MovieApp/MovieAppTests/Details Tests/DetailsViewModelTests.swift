//
//  DetailsViewModelTests.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import XCTest
@testable import MovieApp

class DetailsViewModelTests: XCTestCase {
    var viewModel: DetailsViewModel!
    let serviceProvider =  MockDetailsWebServiceProvider()
    
    override func setUpWithError() throws {
        viewModel = DetailsViewModel(onLoadDataProvider: MockDetailsOnLoadDataProvider(), dataServiceProvider: serviceProvider, imageServiceProvider: ImageServiceProvider())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testSuccessfulDataRequest() {
        let expectation = expectation(description: "downloading data")
        viewModel.refreshDetailsUI = {
            expectation.fulfill()
        }
        
        viewModel.fetchMovieDetails(imdbId: "")
        waitForExpectations(timeout: 3)
    }
    
    func testMoviePosterUrl() {
        viewModel.fetchMovieDetails(imdbId: "")
        XCTAssertNotNil(viewModel.getMoviePosterUrl())
        XCTAssertEqual(viewModel.getMoviePosterUrl(), "https://m.media-amazon.com/images/M/MV5BNzM3NDFhYTAtYmU5Mi00NGRmLTljYjgtMDkyODQ4MjNkMGY2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg")
    }
    
    func testMovieTitle() {
        viewModel.fetchMovieDetails(imdbId: "")
        XCTAssertNotNil(viewModel.getMovieTitle())
        XCTAssertEqual(viewModel.getMovieTitle(), "Kill Bill: Vol. 1")
    }
    
    func testMovieReleaseYear() {
        viewModel.fetchMovieDetails(imdbId: "")
        XCTAssertNotNil(viewModel.getMovieReleaseYear())
        XCTAssertEqual(viewModel.getMovieReleaseYear(), "Release Year: 2003")
    }
    
    func testMovieImdbRating() {
        viewModel.fetchMovieDetails(imdbId: "")
        XCTAssertNotNil(viewModel.getMovieImdbRating())
        XCTAssertEqual(viewModel.getMovieImdbRating(), "IMDB Rating: 8.2")
    }
    
    func testMovieGenre() {
        viewModel.fetchMovieDetails(imdbId: "")
        XCTAssertNotNil(viewModel.getMovieGenre())
        XCTAssertEqual(viewModel.getMovieGenre(), "Genre: Action, Crime, Drama")
    }
    
    func testMovieEarnings() {
        viewModel.fetchMovieDetails(imdbId: "")
        XCTAssertNotNil(viewModel.getMovieEarnings())
        XCTAssertEqual(viewModel.getMovieEarnings(), "Earnings: $70,099,045")
    }
    
    func testMoviePlot() {
        viewModel.fetchMovieDetails(imdbId: "")
        XCTAssertNotNil(viewModel.getMoviePlot())
        XCTAssertEqual(viewModel.getMoviePlot(), "The lead character, called 'The Bride,' was a member of the Deadly Viper Assassination Squad, led by her lover 'Bill.' Upon realizing she was pregnant with Bill's child, 'The Bride' decided to escape her life as a killer. She fled to Texas, met a young man, who, on the day of their wedding rehearsal was gunned down by an angry and jealous Bill (with the assistance of the Deadly Viper Assassination Squad). Four years later, 'The Bride' wakes from a coma, and discovers her baby is gone. She, then, decides to seek revenge upon the five people who destroyed her life and killed her baby. The saga of Kill Bill Volume I begins.")
    }
}
