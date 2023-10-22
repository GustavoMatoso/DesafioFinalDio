//
//  PostData.swift
//  desafioFinal2
//
//  Created by Gustavo Matoso on 17/10/23.
//

import Foundation

struct Results: Decodable{
    
    let hits: [Post]
    //let posts: [Post]
    
    
}

struct Post: Decodable, Identifiable{
    
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}


