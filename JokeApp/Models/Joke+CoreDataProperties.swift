//
//  Joke+CoreDataProperties.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/25/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var text: String?
   

}
