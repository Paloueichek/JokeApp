//
//  JokeManagerFetch.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/29/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//

import Foundation
import CoreData

protocol JokeManagerFetchProtocol {
    func clearData()
    var fetchedResultController: NSFetchedResultsController<NSFetchRequestResult> { get }
}

class JokeManagerFetch {
    func clearData(){
        do {
            let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Joke.self))
            do{
                let objects = try context.fetch(fetchRequest)
                _ = objects.map{context.delete($0 as! NSManagedObject)}
            }
            catch let error {
                print("\(error)")
            }
        }
    }
    
    lazy var fetchedResultController: NSFetchedResultsController<NSFetchRequestResult> = {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Joke")
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date" , ascending: false)]
            let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.sharedInstance.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
            //  frc.delegate = self
            return frc
            
    }()
}
