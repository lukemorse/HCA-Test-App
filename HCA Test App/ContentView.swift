//
//  ContentView.swift
//  HCA Test App
//
//  Created by Luke Morse on 9/18/20.
//

import SwiftUI

struct ContentView: View {
    private var manager = NetworkManager()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear() {
                self.manager.fetchPosts() {_ in }
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
