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
    
    let jokeManager = JokeManager()
    let networkManager = NetworkManager()
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.networkManager.jokeGet{  (result) in
        self.textLabel.text = result
            print(result)
            self.jokeManager.saveInCoreDataWith(saveJoke: result)
            }
         }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
}

