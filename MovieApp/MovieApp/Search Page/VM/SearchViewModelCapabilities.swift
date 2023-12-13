//
//  SearchViewModelCapabilities.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation
import UIKit

typealias SearchViewModelCapabilities = SearchMovieDataServiceProvider &
MovieListDataProvider &
MovieListRefreshNotifier &
MoviePosterImageDownloader &
SearchStateProvider &
SearchQueryProvider

protocol SearchMovieDataServiceProvider {
    func fetchMovieSearchResults(queryString: String?)
}

protocol MovieListRefreshNotifier {
    var refreshListUI: (() -> Void)? { get set }
}

protocol MovieListDataProvider {
    func numberOfSearchItems() -> Int
    func searchItem(atIndex index: Int) -> Movie?
    func numOfPagesLoaded() -> Int
    func totalOfPagesLoaded() -> Int
}

protocol MoviePosterImageDownloader {
    func setMoviePoster(forView view: ImageServiceProvider, url: String)
}

protocol SearchStateProvider {
    var searchStateDidUpdate: ((_ newState: SearchState) -> Void)? { get set }
}

protocol SearchQueryProvider {
    func getCurrentSearchQueryString() -> String?
}
