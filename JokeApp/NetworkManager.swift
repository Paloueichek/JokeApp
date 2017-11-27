//
//  NetworkManager.swift
//  JokeApp
//
//  Created by Patrick Aloueichek on 11/18/17.
//  Copyright © 2017 Patrick Aloueichek. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NetworkManager: NSObject {
    private let basePath = "http://api.icndb.com/jokes/random"
    func jokeGet(completion: @escaping(String)->()) {
        
        let url = basePath
        let request = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: request) { (data: Data? , response: URLResponse?, error: Error?) in
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any] {
                        if let valueCast = json["value"] as? [String: Any] {
                            if let jokeCast = valueCast["joke"] as? String {
                                DispatchQueue.main.async{
                                completion(jokeCast)
                                }
                            }
                        }
                    }     
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    } 
    enum Result<T> {
        case Success(T)
        case Error(String)
    }
}

