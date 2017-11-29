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
    
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var jokeLabel: UILabel!
    var shareAction: (() ->Void)?
    var sharePrint: (() ->Void)?
    
    func setJoke(joke: Joke) {
        self.jokeLabel.text = joke.text
        if let date = joke.date {
            self.dateLabel.text = DateFormatter.jokeDateFormatter.string(from: date)
        }
    }
    @IBAction private func shareButtonTapped() {
        self.shareAction?()
        }
    }



