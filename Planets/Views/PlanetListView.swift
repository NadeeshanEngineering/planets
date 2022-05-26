//
//  PlanetListView.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import SwiftUI
import Combine

struct PlanetListView: View {
    @StateObject var planetListViewModel = PlanetListViewModel()
    
    var body: some View {
        VStack {
            List(planetListViewModel.planets, id: \.name) { planet in
                Text(planet.name)
                    .padding()
            }
        }
        .onAppear {
            planetListViewModel.onAppear()
        }
    }
}

struct PlanetListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListView()
    }
}
