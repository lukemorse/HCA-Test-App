//
//  PostListViewModel.swift
//  HCA Test App
//
//  Created by Luke Morse on 9/20/20.
//

import Foundation

class PostListViewModel: ObservableObject {
    private var manager = NetworkManager()
    @Published var posts: [Post] = []
    
    public func fetchPosts() {
        manager.fetchPosts { posts in
            self.posts = posts
        }
    }
}
