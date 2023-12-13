//
//  DetailsDbServiceProvider.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import CoreData
import Foundation

class DetailsDbServiceProvider: DetailsDataProviding {
    
    func fetchDetails(forImdbId imdbId: String, completionHandler: @escaping DetailsDataServiceCompletionHandler) {
        let managedObjectContext = CoreDataStack.sharedInstance.persistentContainer.viewContext
        let movieFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieMO")
        movieFetchRequest.predicate = NSPredicate(format: "imdbId == %@", imdbId)
        
        do {
            guard let fetchedMovies = try? managedObjectContext.fetch(movieFetchRequest) as? [MovieMO], fetchedMovies.count > 0 else {
                completionHandler(nil, SearchError.other)
                return
            }
            completionHandler(fetchedMovies[0].toModel(), nil)
        }
    }
}
