//
//  TableViewVC.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/20/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//

import Foundation
import UIKit



class TableViewVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
  
    var menuObject = MenuVC()
    
    
    @IBAction func backButton(_ sender: Any) {
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuObject.jokeArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = self.menuObject.jokeArray[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(menuObject)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

