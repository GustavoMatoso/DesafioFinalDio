//
//  News.swift
//  desafioFinal2
//
//  Created by Gustavo Matoso on 17/10/23.
//

import Foundation

struct News: Codable,Identifiable {
    let id: Int
    let title: String
    let imageUrl: String
    let summary: String
    let url: String
    let newsSite: String
}
