//
//  NetworkManager.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/18/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//

import Foundation
import UIKit

struct NetworkManager  {
    let type: String
    let value: String
    let id : Int
    let joke: String
    
    static var jokeObjectString : String = ""
  
    
    enum SerializationError: Error {
        case success(String)
        case invalid(String)
    }
    init(json: [String: Any]) throws {
        guard let type = json["type"] as? String else { throw SerializationError.invalid("type is missing")}
        guard let value = json["value"] as? String else { throw SerializationError.invalid("value is missing")}
        guard let id = json["id"] as? Int else { throw SerializationError.invalid("value is missing")}
        guard let joke = json["joke"] as? String else { throw SerializationError.invalid("value is missing")}
        
        self.type = type
        self.value = value
        self.id = id
        self.joke = joke
        
    }
    
    
    static let basePath = "http://api.icndb.com/jokes/random"
    static func jokeGet(completion: @escaping(String) -> ()) {
        let url = basePath
        let request = URLRequest(url: URL(string: url)!)
        
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse? , error: Error?) in
           
            if let data = data {
                do {
                   
                    if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any] {
                       
                        if let valueCast = json["value"] as? [String: Any] {
                          
                            if let jokeCast = valueCast["joke"] as? String {
                                print(jokeCast)
                                jokeObjectString = jokeCast
                            }
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
                DispatchQueue.main.async {
                     completion(jokeObjectString)
                }
               
            }
        }
      task.resume()
    
    }
    
}
