//
//  TechViewModel.swift
//  desafioFinal2
//
//  Created by Gustavo Matoso on 21/10/23.
//

import Foundation
import Combine

class TechViewModel: ObservableObject {
    @Published var techPosts: [Post] = []

    private var cancellables: Set<AnyCancellable> = []

    init() {
        fetchData()
    }

    func fetchData() {
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else {
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Results.self, decoder: JSONDecoder())
            .map(\.hits)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] posts in
                self?.techPosts = posts
            })
            .store(in: &cancellables)
    }
}




