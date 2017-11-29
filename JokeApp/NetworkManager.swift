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

protocol NetworkManagerProtocol {
    func jokeGet(completion: ((String)->()))    
}
class NetworkManager: NSObject {
    private let basePath = "http://api.icndb.com/jokes/random"
    
    func jokeGet(completion: @escaping (Result<(String)>)->()) {
        let url = basePath
        let request = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: request) { (data: Data? , response: URLResponse?, error: Error?) in
            if let data = data {
                do {
                    guard error == nil else { return completion(.Error("Something went wrong"))}
                    if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any] {
                        if let valueCast = json["value"] as? [String: Any] {
                            if let jokeCast = valueCast["joke"] as? String {
                                DispatchQueue.main.async{
                                completion(.Success(jokeCast))
                                }
                            }
                        }
                    }     
                }
                catch let error{
                    return completion(.Error(error.localizedDescription))
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

