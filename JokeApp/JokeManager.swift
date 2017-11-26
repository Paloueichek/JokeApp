//
//  JokeManager.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/26/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//

import Foundation
import CoreData


class JokeManager  {
    
    func createStringEntity(stringJoke: String) -> NSManagedObject? {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        if let stringEntity = NSEntityDescription.insertNewObject(forEntityName: "Joke", into: context) as? Joke {
            stringEntity.text = stringJoke
            return stringEntity
        }
        return nil
    }
    
    func saveInCoreDataWith(saveJoke: String) {
        _ = self.createStringEntity(stringJoke: saveJoke)
        do {
            try
                CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
        } catch let error {
            print(error)
        }
    }

    lazy var fetchedResultController:
        NSFetchedResultsController<NSFetchRequestResult> = {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Joke.self))
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "text" , ascending: true)]
            let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.sharedInstance.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName :nil)
          //  frc.delegate = self
            return frc
            
    }()
    
    
    
}
