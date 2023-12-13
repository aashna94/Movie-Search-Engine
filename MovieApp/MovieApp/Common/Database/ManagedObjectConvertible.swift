//
//  ManagedObjectConvertible.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//
import Foundation
import CoreData

protocol ManagedObjectConvertible {
    
    associatedtype ManagedObject
    func toManagedObject(in context: NSManagedObjectContext) -> ManagedObject?
}
