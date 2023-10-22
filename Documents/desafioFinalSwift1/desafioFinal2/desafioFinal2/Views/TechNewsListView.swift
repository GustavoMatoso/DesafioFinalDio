//
//  TechNewsListView.swift
//  desafioFinal2
//
//  Created by Gustavo Matoso on 21/10/23.
//

import SwiftUI
import SafariServices

struct TechNewsListView: View {
    @ObservedObject var viewModel: TechViewModel

    var body: some View {
        List(viewModel.techPosts) { post in
            VStack(alignment: .leading, spacing: 10) {
                
                        Image("techimage1") 
                            .resizable()
                            .scaledToFill()
                            .frame(width: 350, height: 200)
                            .cornerRadius(10)

                        Text(post.title)
                            .font(.title3)
                            .fontWeight(.bold)
                
                        Text(post.url!)
                            .foregroundColor(.gray)
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        if let postURL = post.url {
                            Button(action: {
                                if let url = URL(string: postURL) {
                                    let safariViewController = SFSafariViewController(url: url)
                                    UIApplication.shared.windows.first?.rootViewController?.present(safariViewController, animated: true, completion: nil)
                                }
                            }) {
                                Text("Read more")
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

