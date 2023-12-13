//
//  MovieCapabilities.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import CoreData
import Foundation

extension Movie: SearchTableViewCellDataProviding { }

extension Movie: DetailsOnLoadDataProviding { }

extension Movie: ManagedObjectConvertible {
    
    typealias ManagedObject = MovieManagedObject
    
    func toManagedObject(in context: NSManagedObjectContext) -> MovieManagedObject? {
        guard let entityName = MovieMO.entity().name,
              let entityDescription = NSEntityDescription.entity(forEntityName: entityName, in: context) else { return nil }
        
        let object = MovieManagedObject(entity: entityDescription, insertInto: context)
        object.imdbId = imdbId
        object.boxOfficeEarnings = boxOfficeEarnings
        object.genre = genre
        object.title = title
        object.imdbRating = imdbRating
        object.plot = plot
        object.year = year
        object.type = type
        object.posterUrl = posterUrl
        return object
    }
    
}
