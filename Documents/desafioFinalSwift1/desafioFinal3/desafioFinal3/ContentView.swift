//
//  ContentView.swift
//  desafioFinal3
//
//  Created by Gustavo Matoso on 21/10/23.
//

import SwiftUI
import ColorFeature



struct ContentView: View {

    let colorFeature = ColorFeatureViewController()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(Color(colorFeature.generateRandomUIColor()))
            Text("Hello, world!")
                .foregroundColor(Color(colorFeature.generateRandomUIColor()))
                .font(.title)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
