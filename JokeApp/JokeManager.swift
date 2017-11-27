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
    
    func createStringEntity(stringJoke: String) -> Joke? {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        if let stringEntity = NSEntityDescription.insertNewObject(forEntityName: "Joke", into: context) as? Joke {
            stringEntity.text = stringJoke
            stringEntity.date = Date()
            return stringEntity
        }
        return nil
    }
    

    
    
    func saveInCoreDataWith(saveJoke: String) -> Joke? {
        let joke = self.createStringEntity(stringJoke: saveJoke)
        do {
            try
                CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
                print("save Successful")
            return joke
        } catch let error {
            print(error)
            return nil
        }
    }
    
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
    
    lazy var fetchedResultController:
        NSFetchedResultsController<NSFetchRequestResult> = {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Joke")
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date" , ascending: false)]
            let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.sharedInstance.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
          //  frc.delegate = self
            return frc
            
    }()
    
    
    
}
