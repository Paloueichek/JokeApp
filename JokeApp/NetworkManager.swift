//
//  NetworkManager.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/18/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//

import Foundation
import UIKit

struct NetworkManager {
    let type: String
    let value: String
    
    enum SerializationError: Error {
        case success(String)
        case invalid(String)
    }
    init(json: [String: Any]) throws {
        guard let type = json["type"] as? String else { throw SerializationError.invalid("type is missing")}
        guard let value = json["value"] as? String else { throw SerializationError.invalid("value is missing")}
        
        self.type = type
        self.value = value
        
    }
    
    static let basePath = "http://api.icndb.com/api"
    static func jokeGet () {
        
        let url = basePath
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response: URLResponse? , error: Error?) in
            var jokeGetArray: [NetworkManager] = []
         
        }
        
    }
}
