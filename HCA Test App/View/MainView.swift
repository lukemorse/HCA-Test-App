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
            PostListView(viewModel: PostListViewModel())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
