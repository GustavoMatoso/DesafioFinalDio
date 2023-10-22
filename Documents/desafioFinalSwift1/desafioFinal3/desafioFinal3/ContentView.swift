//
//  ContentView.swift
//  desafioFinal3
//
//  Created by Gustavo Matoso on 21/10/23.
//

import SwiftUI
import ColorFeature

struct ContentView: View {
    
    var randomColor = ColorFeatureViewController()
    
    @State private var backgroundColor: Color
    
    @State private var cellColors: [[Color]] = Array(repeating: Array(repeating: Color.gray, count: 3), count: 4)

    init() {
        
        let initialColor = randomColor.generateRandomUIColor()
        backgroundColor = Color(initialColor)
    }

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Clique Dio!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                VStack(spacing: 25) {
                    ForEach(0..<4, id: \.self) { row in
                        HStack(spacing: 10) {
                            ForEach(0..<3, id: \.self) { col in
                                Circle()
                                    .fill(cellColors[row][col])
                                    .frame(width: 120, height: 120)
                                    .onTapGesture {
                                        cellColors[row][col] = Color(randomColor.generateRandomUIColor())
                                    }
                            }
                        }
                    }
                }
                
                Button(action: {
                    let darkenedColor = randomColor.darkenColor(UIColor(backgroundColor), by: 0.2)
                    backgroundColor = Color(darkenedColor)
                }) {
                    Text("Darken Feature")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(60)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
