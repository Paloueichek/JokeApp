//
//  ViewController.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/18/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    var jokeArray: [String] = []
    
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
        
         NetworkManager.jokeGet(completion: { [weak self] jokeString in self?.textLabel.text = jokeString
            self?.jokeArray.append(jokeString)
         })
        print(jokeArray)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

