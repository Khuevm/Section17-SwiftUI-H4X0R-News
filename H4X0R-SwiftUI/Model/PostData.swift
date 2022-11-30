//
//  PostData.swift
//  H4X0R-SwiftUI
//
//  Created by Khue on 29/11/2022.
//

import Foundation

struct PostData: Decodable {
    let hits: [Posts]
}

struct Posts: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
