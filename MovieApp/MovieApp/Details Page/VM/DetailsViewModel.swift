//
//  DetailsViewModel.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation
import UIKit

class DetailsViewModel: DetailsViewModelCapabilities {
    
    var refreshDetailsUI: (() -> Void)?
    let onLoadDataProvider: DetailsOnLoadDataProviding
    let dataServiceProvider: DetailsDataProviding
    let imageServiceProvider: ImageServiceProviding
    private var movieDetails: Movie?
    
    init(onLoadDataProvider: DetailsOnLoadDataProviding, dataServiceProvider: DetailsDataProviding, imageServiceProvider: ImageServiceProviding) {
        self.onLoadDataProvider = onLoadDataProvider
        self.dataServiceProvider = dataServiceProvider
        self.imageServiceProvider = imageServiceProvider
    }
}

/// MovieDetailsDataServiceProvider
extension DetailsViewModel {
    
    func fetchMovieDetails(imdbId: String) {
        dataServiceProvider.fetchDetails(forImdbId: onLoadDataProvider.imdbId) { [weak self] response, error in
            self?.movieDetails = response
            self?.refreshDetailsUI?()
        }
    }
}

/// MovieDetailsDataProvider
extension DetailsViewModel {
    func getMoviePosterUrl() -> String? {
        movieDetails?.posterUrl
    }
    
    func getMovieTitle() -> String? {
        movieDetails?.title
    }
    
    func getMovieReleaseYear() -> String? {
        return "Release Year: \(String(describing: movieDetails?.year ?? "N/A"))"
    }
    
    func getMovieImdbRating() -> String? {
        return "IMDB Rating: \(String(describing: movieDetails?.imdbRating ?? "N/A"))"
    }
    
    func getMovieGenre() -> String? {
        return "Genre: \(String(describing: movieDetails?.genre ?? "N/A"))"
    }
    
    func getMovieEarnings() -> String? {
        return "Earnings: \(String(describing: movieDetails?.boxOfficeEarnings ?? "N/A"))"
    }
    
    func getMoviePlot() -> String? {
        return movieDetails?.plot
    }
}

/// MoviePosterImageDownloader
extension DetailsViewModel {
    func setMoviePoster(forView view: ImageServiceProvider, url: String) {
        view.loadImageFor(url) {}
    }
}
