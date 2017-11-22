//
//  ViewController.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/18/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func replayButton(_ sender: Any) {
        self.textLabel.text = ""
        self.jokeTextCaught()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jokeTextCaught()
    
    }
        
    func jokeTextCaught() {
        self.textLabel.text = ""
         NetworkManager.jokeGet(completion: { [weak self] jokeString in self?.textLabel.text = jokeString })
    }
   
        
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
       
 
    


}

