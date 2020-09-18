//
//  PostView.swift
//  HCA Test App
//
//  Created by Luke Morse on 9/18/20.
//

import SwiftUI

struct PostView: View {
    let postIndex: Int
    @State var post: Post
    
    var body: some View {
        VStack {
            Text(post.title)
                .font(.largeTitle)
                .padding(10)
            HStack {
                Text(post.user.displayName).padding()
                Spacer()
                Text("\(post.score)")
                    .padding()
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 4)
                            .padding(5))
            }
            .padding()
        }
        .background(postIndex % 2 == 0 ? Color.blue : Color.red)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(postIndex: 0, post: Post(answerCount: 3, title: "How do I learn how to code and stuff?", score: -2, user: User(reputation: "", user_id: "", profileImage: "", displayName: "Bobby_123")))
    }
}
