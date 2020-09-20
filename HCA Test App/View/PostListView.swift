//
//  ContentView.swift
//  HCA Test App
//
//  Created by Luke Morse on 9/18/20.
//

import SwiftUI

struct PostListView: View {
    private var manager = NetworkManager()
    @State var posts: [Post] = []
    
    var body: some View {
        List {
            ForEach(0..<self.posts.count, id: \.self) { idx in
                PostView(postIndex: idx, post: self.posts[idx])
            }
        }.onAppear() {
            self.manager.fetchPosts() { posts in
                self.posts = posts
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
