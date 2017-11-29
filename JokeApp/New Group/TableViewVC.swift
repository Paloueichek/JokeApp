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
    
    private let cellID = "Cell_ID"
    private let jokeManagerFetch = JokeManagerFetch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        try? self.jokeManagerFetch.fetchedResultController.performFetch()
    }
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.jokeManagerFetch.fetchedResultController.sections?.first?.numberOfObjects {
            return count
        }
        return 0
    }
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

      let cell = tableView.dequeueReusableCell(withIdentifier: cellID , for: indexPath) as! TableViewCell
        if let joke = self.jokeManagerFetch.fetchedResultController.object(at: indexPath) as? Joke {
            cell.setJoke(joke: joke)
            cell.shareAction = { [weak self] in
                let share = UIActivityViewController(activityItems: [joke.text], applicationActivities: [])
                self?.present(share, animated: true)
            }
        }
        return cell
    }
}

