//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Kanha Gupta on 12/07/24.
//

import Foundation

class NetworkManager: ObservableObject{
    @Published var posts = [Post]()
    
    //URL Session
    func performRequest(with urlString: String){
        // 1) Create a URL
        if let url = URL(string: urlString){
            
            // 2) Create URL Session
            let session = URLSession(configuration: .default)
            
            // 3) Give Session a Task
            let task = session.dataTask(with: url, completionHandler: handle(data:  response:  error:  ))
            
            // 4) Start the task
            task.resume()
        }
    }
    //Handler for URL Session
    func handle(data: Data?, response: URLResponse?, error: Error?){
        if error == nil{
            let decoder = JSONDecoder()
            if let safeData = data {
                do{
                    let results = try decoder.decode(Results.self, from: safeData)
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}
