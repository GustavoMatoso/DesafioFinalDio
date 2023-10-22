//
//  ContentView.swift
//  desafioFinal2
//
//  Created by Gustavo Matoso on 17/10/23.
//
import SwiftUI
import SafariServices

struct ContentView: View {
    @StateObject var techViewModel = TechViewModel()
    @StateObject var spaceViewModel = SpaceViewModel()
    @StateObject var allNewsViewModel = AllNewsViewModel()
    @State private var selectedNews: CombinedNews?

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.mint, .black]), startPoint: .topLeading, endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                    VStack {
                        NavigationLink(destination: NewsListView(viewModel: allNewsViewModel)) {
                            Image("allnewsback")
                                .resizable()
                                .frame(width: 350, height: 150)
                                .cornerRadius(10)
                        }
        
                        NavigationLink(destination: SpaceNewsListView(viewModel: spaceViewModel)) {
                            Image("spaceback")
                                .resizable()
                                .frame(width: 350, height: 150)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: TechNewsListView(viewModel: techViewModel)) {
                            Image("technewsback")
                                .resizable()
                                .frame(width: 350, height: 150)
                                .cornerRadius(10)
                        }

                      
                    }

                    Spacer()
                }

            }
        }
    }


