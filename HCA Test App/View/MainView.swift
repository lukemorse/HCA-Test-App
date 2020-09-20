//
//  MainView.swift
//  HCA Test App
//
//  Created by Luke Morse on 9/20/20.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            
            NavigationLink(
                destination: PostListView(viewModel: PostListViewModel()),
                label: {
                    button
                })
        }
    }
    
    var button: some View {
        HStack {
            Image(systemName: "captions.bubble")
                .font(.title)
            Text("View Posts")
                .fontWeight(.semibold)
                .font(.title)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.red)
        .cornerRadius(40)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
