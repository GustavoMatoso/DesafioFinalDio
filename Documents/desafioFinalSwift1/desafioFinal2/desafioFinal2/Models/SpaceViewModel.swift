//
//  SpaceViewModel.swift
//  desafioFinal2
//
//  Created by Gustavo Matoso on 21/10/23.
//


import Foundation
import Combine

class SpaceViewModel: ObservableObject {
    @Published var spaceNews: [News] = []

    private var cancellables: Set<AnyCancellable> = []

    init() {
        fetchData()
    }

    func fetchData() {
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles") else {
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
                    .map(\.data)
                    .decode(type: [News].self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .sink(receiveCompletion: { [weak self] completion in
                        switch completion {
                        case .finished:
                            break
                        case .failure(let error):
                            print("Error: \(error)")
                        }
                        self?.cancellables.removeAll()
                    }, receiveValue: { [weak self] news in
                        self?.spaceNews = news
                    })
                    .store(in: &cancellables)
            }
}


