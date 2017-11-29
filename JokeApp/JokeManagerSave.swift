//
//  JokeManager.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/26/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//

import Foundation
import CoreData

protocol JokeManagerSaveProtocol {
    func createStringEntity(stringJoke: String) -> Joke?
    func saveInCoreDataWith(saveJoke: String) -> Joke?
}

class JokeManagerSave {
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
            return joke
        } catch let error {
            debugPrint(error)
            return nil
        }
    }
}
