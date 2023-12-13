//
//  WebServiceManager.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

struct WebServiceManager {
    
    private static var currentTasks: [URLSessionTask] = []
    
    static func fetchData(urlRequest: URLRequest, completionHandler: @escaping WebServiceCompletionHandler) {
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            completionHandler(data, response, error)
            currentTasks.removeAll { $0.state == .completed }
        }
        currentTasks.append(task)
        task.resume()
    }
    
    static func cancelAll() {
        currentTasks.forEach { $0.cancel() }
        currentTasks.removeAll()
    }
}
