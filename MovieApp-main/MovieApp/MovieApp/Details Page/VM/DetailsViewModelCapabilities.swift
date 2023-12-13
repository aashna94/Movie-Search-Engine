//
//  DetailsViewModelCapabilities.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

typealias DetailsViewModelCapabilities = MovieDetailsDataServiceProvider &
MovieDetailsRefreshNotifier &
MovieDetailsDataProvider &
MoviePosterImageDownloader

protocol MovieDetailsDataServiceProvider {
    func fetchMovieDetails(imdbId: String)
}

protocol MovieDetailsRefreshNotifier {
    var refreshDetailsUI: (() -> Void)? { get set }
}

protocol MovieDetailsDataProvider {
    func getMoviePosterUrl() -> String?
    func getMovieTitle() -> String?
    func getMovieReleaseYear() -> String?
    func getMovieGenre() -> String?
    func getMovieEarnings() -> String?
    func getMovieImdbRating() -> String?
    func getMoviePlot() -> String?
}
