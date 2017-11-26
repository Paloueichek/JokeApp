//
//  TableViewVC.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/20/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//

import Foundation
import UIKit



class TableViewVC: UITableViewController {
    
    let cellID = "CellID"

    
    let jokeManager = JokeManager()
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.jokeManager.fetchedResultController.sections?.first?.numberOfObjects {
            return count
        }
        return 0
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

      let cell = tableView.dequeueReusableCell(withIdentifier: cellID , for: indexPath) as! TableViewCell
        
        if let jokeString = self.jokeManager.fetchedResultController.object(at: indexPath) as? Joke {
            cell.setJokeString(joke: jokeString)
        }
     
        return cell
    }
    


}

