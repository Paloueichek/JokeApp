//
//  DateFormatter + Ext.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/27/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let jokeDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm dd:MM:yyyy"
        return formatter
    }()
}
