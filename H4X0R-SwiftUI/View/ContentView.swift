//
//  ContentView.swift
//  H4X0R-SwiftUI
//
//  Created by Khue on 29/11/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                if post.url != nil {
                    NavigationLink(destination: DetailView(url: post.url)) {
                        CellView(post: post)
                    }
                }
                else {
                    CellView(post: post)
                }
            }
            .navigationTitle("H4X0R NEWS")
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CellView: View {
    var post: Posts
    var body: some View {
        HStack{
            Text("\(post.points)")
                .foregroundColor(.green)
                .padding(.trailing)
            Text(post.title)
        }
    }
}
