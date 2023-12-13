//
//  MockSearchViewModel.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import Foundation
import UIKit
@testable import MovieApp

class MockSearchViewModel: SearchViewModelCapabilities {
    
    private var response: SearchSuccessResponse!
    
    func numberOfSearchItems() -> Int {
        1
    }
    
    func searchItem(atIndex index: Int) -> Movie? {
        if index == 0 {
            
        }
        return nil
    }
    
    var refreshListUI: (() -> Void)?
    
    var searchStateDidUpdate: ((SearchState) -> Void)?
    
    func setMoviePoster(forView view: MovieApp.ImageServiceProvider, url: String) {
        
    }
    
    func fetchMovieSearchResults(queryString: String?) {
        
        guard let data = mockSuccessResponseOneResult.data(using: .utf8),
            let responseModel = try? JSONDecoder().decode(SearchSuccessResponse.self, from: data) else {
            
            return
        }
        
        response = responseModel
        
        searchStateDidUpdate?(.data)
        
        refreshListUI?()
    }
    
    func getCurrentSearchQueryString() -> String? {
        
        "Avengers"
    }
}
