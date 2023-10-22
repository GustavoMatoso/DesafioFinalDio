//
//  NewsListView.swift
//  desafioFinal2
//
//  Created by Gustavo Matoso on 21/10/23.
//

import SwiftUI
import SafariServices


struct NewsListView: View {
    @ObservedObject var viewModel: AllNewsViewModel
  
    var body: some View {
        List(viewModel.combinedNews) { news in
            VStack(alignment: .leading) {
                if let imageUrl = news.imageUrl {
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 350, height: 200)
                            .cornerRadius(10)
                    } placeholder: {
                        Image("techimage1")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 350, height: 200)
                            .cornerRadius(10)
                    }
                }

                VStack(alignment: .leading, spacing: 10) {
                    Image(news.newsSite ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 30)
                        .clipped()

                    Text(news.title)
                        .foregroundColor(.black)
                        .font(.title3)
                        .fontWeight(.bold)

                    Text(news.summary ?? "")
                        .foregroundColor(.gray)
                        .font(.callout)
                        .fontWeight(.bold)

                    if URL(string: news.url) != nil {
                        Button(action: {
                            if let url = URL(string: news.url) {
                                let safariViewController = SFSafariViewController(url: url)
                                UIApplication.shared.windows.first?.rootViewController?.present(safariViewController, animated: true, completion: nil)
                            }
                        }) {
                            Text("Read more")
                        }
                    } else {
                        Text("Invalid URL")
                    }
                }
            }
            .padding(10)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        .listStyle(PlainListStyle())
       
    }
}

