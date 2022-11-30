//
//  NetworkManager.swift
//  H4X0R-SwiftUI
//
//  Created by Khue on 29/11/2022.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Posts]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if(error == nil) {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let result = try decoder.decode(PostData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = result.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                } else {
                    print(error!)
                }
            }
            task.resume()
        }
    }
}
