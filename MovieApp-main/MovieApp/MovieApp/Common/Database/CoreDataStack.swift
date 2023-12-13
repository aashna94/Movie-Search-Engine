//
//  CoreDataStack.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation
import CoreData

class CoreDataStack {
    static let sharedInstance = CoreDataStack()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MovieApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
