//
//  PostData.swift
//  H4XOR News
//
//  Created by Kanha Gupta on 12/07/24.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

//We use a computed variable for ID
struct Post: Decodable, Identifiable {
    var id: String{
        return objectID
    }
    
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
