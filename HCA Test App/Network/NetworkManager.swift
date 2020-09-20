//
//  NetworkManager.swift
//  HCA Test App
//
//  Created by Luke Morse on 9/18/20.
//

import Foundation

final class NetworkManager {
    
    var posts: [Post] = []
    private let BASE_URL = "https://api.stackexchange.com/"
    
    func fetchPosts(completionHandler: @escaping ([Post]) -> Void) {
        let url = URL(string: BASE_URL + "/2.2/search/advanced?order=desc&sort=activity&accepted=True&site=stackoverflow")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching posts: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            var resultPosts: [Post] = []
            let decoder = JSONDecoder()
            
            if let data = data {
                do {
                    let response = try decoder.decode(APIResonponse.self, from: data)
                    for post in response.items {
                        if post.answerCount > 1 {
                            resultPosts.append(post)
                        }
                    }
                    completionHandler(resultPosts)
                } catch {
                    print(error)
                }   
            }
        })
        task.resume()
    }
}
