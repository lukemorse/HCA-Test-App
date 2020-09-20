//
//  ContentView.swift
//  HCA Test App
//
//  Created by Luke Morse on 9/18/20.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject var viewModel: PostListViewModel
    
    var body: some View {
        List {
            ForEach(0..<self.viewModel.posts.count, id: \.self) { idx in
                PostView(postIndex: idx, post: self.viewModel.posts[idx])
            }
        }.onAppear() {
            self.viewModel.fetchPosts()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(viewModel: PostListViewModel())
    }
}
