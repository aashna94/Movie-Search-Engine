//
//  SearchResponse.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

struct SearchSuccessResponse: Codable {
    
    var results: [Movie]
    var totalResults: Int
    var response: Bool
    var error: String
    // properties not decoded from API JSON response
    var totalPages: Int { // number of valid pages of results to request from server (each page is 10 results)
        return (totalResults / 10 ) + 1
    }
    var numPagesLoaded: Int = 1
    
    enum CodingKeys: String, CodingKey {
        case results = "Search"
        case totalResults = "totalResults"
        case response = "Response"
        case error = "Error"
    }
    
    init() {
        self.results = []
        self.totalResults = 0
        self.response = false
        self.error = ""
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let decodedResults = try? container.decode([Movie].self, forKey: .results) {
            self.results = decodedResults
        } else {
            self.results = []
        }
        if let decodedTotalResults = try? container.decode(String.self, forKey: .totalResults) {
            self.totalResults = Int(decodedTotalResults) ?? 0
        } else {
            self.totalResults = 0
        }
        if let decodedResponse = try? container.decode(Bool.self, forKey: .response) {
            self.response = decodedResponse
        } else {
            self.response = false
        }
        if let decodedError = try? container.decode(String.self, forKey: .error) {
            self.error = decodedError
        } else {
            self.error = ""
        }
    }
}


struct Movie: Codable {
    
    let title: String
    
    let year: String
    
    let imdbId: String
    
    let imdbRating: String?
    
    let type: String
    
    let posterUrl: String
    
    let genre: String?
    
    let plot: String?
    
    let boxOfficeEarnings: String?
    
    
    private enum CodingKeys : String, CodingKey {
        
        case title = "Title",
             
             year = "Year",
             
             imdbId = "imdbID",
             
             imdbRating = "imdbRating",
             
             type = "Type",
             
             posterUrl = "Poster",
             
             genre = "Genre",
             
             plot = "Plot",
             
             boxOfficeEarnings = "BoxOffice"
    }
}


struct FailureResponse: Codable {
    
    let response: String
    
    let errorReason: String
    
    
    private enum CodingKeys : String, CodingKey {
        
        case response = "Response",
             
             errorReason = "Error"
    }
    
    
    var isTooManyResults: Bool {
        
        errorReason.lowercased().contains("too many results")
    }
    
    
    var isMovieNotFound: Bool {
        
        errorReason.lowercased().contains("movie not found")
    }
    
    
    var isInvalidImdbId: Bool {
        
        errorReason.lowercased().contains("incorrect imdb id")
    }
}
