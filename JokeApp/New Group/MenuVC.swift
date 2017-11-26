//
//  ViewController.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/18/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//

import UIKit
import CoreData

class MenuVC: UIViewController {
    var jokeArray: [String] = []
    
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func replayButton(_ sender: Any) {
        self.textLabel.text = ""
        self.jokeTextCaught()
    }
    
    override func viewDidLoad() {
        
    
    }
    func jokeTextCaught() {
        
        
        print(jokeArray)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createStringEntity(dictionary: [String: AnyObject]) -> NSManagedObject? {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        if let stringEntity = NSEntityDescription.insertNewObject(forEntityName: "Joke", into: context) as? Joke {
            
            stringEntity.text = dictionary["text"] as? String
            return stringEntity
        }
        return nil
    }
    
    private func saveInCoreDataWith(array: [[String: AnyObject]]) {
        
        _ = array.map{ self.createStringEntity(dictionary: $0)}
        do {
            try
            CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
        } catch let error {
            print(error)
        }
        
    }
}

