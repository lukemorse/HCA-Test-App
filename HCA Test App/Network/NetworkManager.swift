//
//  NetworkManager.swift
//  HCA Test App
//
//  Created by Luke Morse on 9/18/20.
//

import Foundation

final class NetworkManager {
    
    var posts: [String] = []
    private let BASE_URL = "https://api.stackexchange.com/"
    
    func fetchPosts(completionHandler: @escaping ([String]) -> Void) {
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
            
            if let data = data,
               let posts = try? JSONDecoder().decode(APIResonponse.self, from: data) {
                print(posts)
                for post in posts.items {
                    if post.answerCount > 1 {
                        print("yup")
                    } else {
                        print("nope")
                    }
                }
            }
            
//            completionHandler(posts)
            
        })
        task.resume()
    }
}
