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
    @State var paginationIndex = 1
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<planetListViewModel.planets.count, id: \.self) { index in
                    let planet = planetListViewModel.planets[index]
                    NavigationLink(destination: PlanetDetailsView(planet: planet)) {
                        Text(planet.name)
                            .padding()
                            .onAppear {
                                if index == planetListViewModel.planets.count - 2 {
                                    paginationIndex += 1
                                    planetListViewModel.fetchPlanets(till: paginationIndex)
                                }
                            }
                    }
                }
            }
            .navigationTitle("Planets")
        }
        .onAppear {
            planetListViewModel.fetchPlanets(till: paginationIndex)
        }
    }
}

struct PlanetListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListView()
    }
}
