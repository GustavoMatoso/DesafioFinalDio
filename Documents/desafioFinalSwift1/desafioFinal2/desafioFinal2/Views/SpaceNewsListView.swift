//
//  SpaceNewsListView.swift
//  desafioFinal2
//
//  Created by Gustavo Matoso on 21/10/23.
//

import Foundation
import SwiftUI
import SafariServices

struct SpaceNewsListView: View {
    @ObservedObject var viewModel: SpaceViewModel

    var body: some View {
        List(viewModel.spaceNews) { news in
            VStack(alignment: .leading, spacing: 10) {
                if let imageUrl = URL(string: news.imageUrl) {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 350, height: 200)
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Image(news.newsSite ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 30)
                    .clipped()
                
                Text(news.title)
                    .foregroundColor(.black)
                    .font(.title3)
                    .fontWeight(.bold)

                Text(news.summary)
                    .foregroundColor(.gray)
                    .font(.callout)
                    .fontWeight(.bold)

                Button(action: {
                    if let url = URL(string: news.url) {
                        let safariViewController = SFSafariViewController(url: url)
                        UIApplication.shared.windows.first?.rootViewController?.present(safariViewController, animated: true, completion: nil)
                    }
                }) {
                    Text("Read more")
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

