//
//  DetailsDataServiceProvider.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

class DetailsDataServiceProvider: DetailsDataProviding {
    let webServiceProvider: DetailsDataProviding
    let dbServiceProvider: DetailsDataProviding
    init(webServiceProvider: DetailsDataProviding, dbServiceProvider: DetailsDataProviding) {
        self.webServiceProvider = webServiceProvider
        self.dbServiceProvider = dbServiceProvider
    }
    
    func fetchDetails(forImdbId imdbId: String, completionHandler: @escaping DetailsDataServiceCompletionHandler) {
        dbServiceProvider.fetchDetails(forImdbId: imdbId) { response, error in
            guard let response = response else {
                self.webServiceProvider.fetchDetails(forImdbId: imdbId) { response, error in
                    completionHandler(response, error)
                    if let movie = response {
                        self.save(movie: movie)
                    }
                }
                return
            }
            completionHandler(response, error)
        }
    }
    
    func save(movie: Movie) {
        let managedObjectContext = CoreDataStack.sharedInstance.persistentContainer.viewContext
        _ = movie.toManagedObject(in: managedObjectContext)
        try? managedObjectContext.save()
    }
}
