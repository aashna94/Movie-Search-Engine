//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation
import UIKit

class SearchViewModel: SearchViewModelCapabilities {
    
    let searchWebServiceProvider: SearchWebServiceProviding
    
    let imageServiceProvider: ImageServiceProviding
    
    var refreshListUI: (() -> Void)?
    
    var searchStateDidUpdate: ((SearchState) -> Void)?
    
    private var movieSearchList: [Movie] = []
    
    private var totalPages = 0
    
    private var numPagesLoaded = 0
    
    private var currentQueryString: String?
    
    private var searchState: SearchState = .empty {
        didSet {
            searchStateDidUpdate?(searchState)
        }
    }
    
    init(searchWebServiceProvider: SearchWebServiceProviding,
         imageServiceProvider: ImageServiceProviding) {
        
        self.searchWebServiceProvider = searchWebServiceProvider
        self.imageServiceProvider = imageServiceProvider
    }
}

/// SearchMovieDataServiceProvider
extension SearchViewModel {
    func fetchMovieSearchResults(queryString: String?) {
        searchWebServiceProvider.cancelAllPreviousSearchRequests()
        currentQueryString = queryString
        guard let queryString, !queryString.isEmpty else {
            searchState = .empty
            movieSearchList = []
            refreshListUI?()
            return
        }
        
        if queryString.count > 2 {
            searchState = .loading
            searchWebServiceProvider.fetchSearchResult(forQueryString: queryString) { [weak self] response, error in
                guard let response, response.results.count > 0 else {
                    self?.searchState = .error(queryString, error!)
                    self?.movieSearchList = []
                    self?.refreshListUI?()
                    return
                }
                
                self?.searchState = .data
                self?.movieSearchList.append(contentsOf: response.results)
                self?.numPagesLoaded += response.numPagesLoaded
                self?.totalPages = response.totalPages
                self?.refreshListUI?()
            }
        }
    }
}

/// MovieListDataProvider
extension SearchViewModel {
    
    func numberOfSearchItems() -> Int {
        return movieSearchList.count
    }
    
    func searchItem(atIndex index: Int) -> Movie? {
        guard index < movieSearchList.count else { return nil }
        return movieSearchList[index]
    }
    
    func numOfPagesLoaded() -> Int {
        return numPagesLoaded
    }
    
    func totalOfPagesLoaded() -> Int {
        return totalPages
    }
}

/// MoviePosterImageDownloader
extension SearchViewModel {
    func setMoviePoster(forView view: ImageServiceProvider, url: String) {
        view.loadImageFor(url) {}
    }
}

/// SearchQueryProvider
extension SearchViewModel {
    func getCurrentSearchQueryString() -> String? {
        return currentQueryString
    }
}
