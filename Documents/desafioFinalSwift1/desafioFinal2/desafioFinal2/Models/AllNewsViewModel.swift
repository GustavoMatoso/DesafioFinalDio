//
//  AllNewsViewModel.swift
//  desafioFinal2
//
//  Created by Gustavo Matoso on 18/10/23.
//


import Foundation
import Alamofire
import Combine

struct CombinedNews: Identifiable, Hashable {
    let id: String
    let title: String
    let imageUrl: String?
    let summary: String?
    let url: String
    let newsSite: String?
}

class AllNewsViewModel: ObservableObject {
    @Published var combinedNews: [CombinedNews] = []

    private var cancellables: Set<AnyCancellable> = []

    init() {
        fetchData()
    }

    func fetchData() {
        let newsURL = "https://api.spaceflightnewsapi.net/v3/articles"
        let postURL = "https://hn.algolia.com/api/v1/search?tags=front_page"

        let newsPublisher = AF.request(newsURL)
            .publishDecodable(type: [News].self)
            .value()
            .eraseToAnyPublisher()

        let postPublisher = AF.request(postURL)
            .publishDecodable(type: Results.self)
            .value()
            .eraseToAnyPublisher()

        Publishers.CombineLatest(newsPublisher, postPublisher)
            .map { (news, results) in
                let combinedNews = news.map { item in
                    CombinedNews(id: "\(item.id)", title: item.title, imageUrl: item.imageUrl, summary: item.summary, url: item.url, newsSite: item.newsSite)
                }

                let combinedPosts = results.hits.map { item in
                    CombinedNews(id: item.id, title: item.title, imageUrl: "", summary: item.url ?? "", url: item.url ?? "", newsSite: "technews")
                }

                return combinedNews + combinedPosts
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    // Lide com o erro de maneira específica, se necessário
                    print("Erro: \(error)")
                }
            }, receiveValue: { [weak self] combinedNews in
                self?.combinedNews = combinedNews
            })
            .store(in: &cancellables)
    }
}






