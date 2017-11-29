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
    
    var jokeManagerSave : JokeManagerSave? = nil
    var jokeManagerFetch : JokeManagerFetch? = nil
    var networkManager : NetworkManager? = nil
    
    var joke : Joke? = nil
    var isJokeOfToday: Bool = false
    
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func replayButton(_ sender: Any) {
        self.updateTableContent()
    }
    @IBAction func shareButton(_ sender: Any) {
        if let joke  = joke {
                let share = UIActivityViewController(activityItems: [joke.text], applicationActivities: nil)
                self.present(share, animated: true)
        }
    } 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateTableContent()
        self.scheduleTimer()
    }
    
    func inject(jokeManagerSave : JokeManagerSave, jokeManagerFetch : JokeManagerFetch, networkManager : NetworkManager) {
        self.jokeManagerSave = jokeManagerSave
        self.jokeManagerFetch = jokeManagerFetch
        self.networkManager = networkManager
    }
    
   private func scheduleTimer() {
        let cal = Calendar(identifier: .gregorian)
        let startOfToday = cal.startOfDay(for: Date())
        if let startOfTomorrow = cal.date(byAdding: .day, value: 1, to: startOfToday) {
            let interval = startOfTomorrow.timeIntervalSince(Date())
            var timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { [weak self] timer in
                self?.updateTableContent()
                self?.scheduleTimer()
                self?.isJokeOfToday = true
            }
        }
    }
    
 override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 private  func updateTableContent() {
        do {
            try self.jokeManagerFetch?.fetchedResultController.performFetch()
        } catch let error {
            print("Error: \(error.localizedDescription)")        }
          self.networkManager?.jokeGet{  (result) in
            switch result {
            case .Success(let data):
                self.jokeManagerFetch?.clearData()
                let joke = self.jokeManagerSave?.saveInCoreDataWith(saveJoke: data)
                self.joke = joke
                self.textLabel.text = data
            case .Error(let message):
                self.showAlertWith(title: "Error", message: message)
            }
        }
    }
    func showAlertWith(title: String, message: String, style: UIAlertControllerStyle = .alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: title, style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}

