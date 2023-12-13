//
//  MovieMO+CoreDataProperties.swift
//
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation
import CoreData


extension MovieMO {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieMO> {
        return NSFetchRequest<MovieMO>(entityName: "MovieMO")
    }
    @NSManaged public var title: String?
    @NSManaged public var year: String?
    @NSManaged public var imdbId: String?
    @NSManaged public var imdbRating: String?
    @NSManaged public var type: String?
    @NSManaged public var posterUrl: String?
    @NSManaged public var genre: String?
    @NSManaged public var plot: String?
    @NSManaged public var boxOfficeEarnings: String?
}

extension MovieMO: ModelConvertible {
    typealias Model = Movie
    
    func toModel() -> Movie? {
        Movie(title: title ?? "",
              year: year ?? "",
              imdbId: imdbId ?? "",
              imdbRating: imdbRating,
              type: type ?? "",
              posterUrl: posterUrl ?? "",
              genre: genre,
              plot: plot,
              boxOfficeEarnings: boxOfficeEarnings)
    }
}
