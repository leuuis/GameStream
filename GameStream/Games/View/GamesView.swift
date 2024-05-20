//
//  GamesView.swift
//  GameStream
//
//  Created by elouis on 5/19/24.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Hello, GamesView!")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                print("Primer elemento del json")
                print("Titulo del primer elemento del json")
            })
    }
}

#Preview {
    GamesView()
}
