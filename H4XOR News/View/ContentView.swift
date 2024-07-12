//
//  ContentView.swift
//  H4XOR News
//
//  Created by Kanha Gupta on 12/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4XOR News")
        }
        .onAppear(perform: {
            self.networkManager.performRequest(with: "http://hn.algolia.com/api/v1/search?tags=front_page")
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
