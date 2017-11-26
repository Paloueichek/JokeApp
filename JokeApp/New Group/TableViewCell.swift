//
//  TableViewCell.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/26/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var jokeTextCell: UILabel!
    
    
    func setJokeString(joke: Joke) {
        
        DispatchQueue.main.async {
        self.jokeTextCell.text = joke.text
            
        }
        
    }
}


