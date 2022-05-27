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
                // MARK: Looping 'planets' array object
                ForEach(0..<planetListViewModel.planets.count, id: \.self) { index in
                    let planet = planetListViewModel.planets[index]
                    // MARK: Navigate to 'PlanetDetailsView'
                    NavigationLink(destination: PlanetDetailsView(planetDetailsViewModel: PlanetDetailsViewModel(id: index, planet: planet))) {
                        Text("\(planet.name) (\(planet.climate))")
                            .padding()
                            .onAppear {
                                // MARK: Load more data when scroll and reached the bottom of the list
                                if index == planetListViewModel.planets.count - 2 {
                                    paginationIndex += 1
                                    // MARK: Fetch data from repository
                                    planetListViewModel.fetchPlanets(till: paginationIndex)
                                }
                            }
                    }
                }
            }
            .navigationTitle("Planets")
        }
        .onAppear {
            // MARK: Fetch data from repository when view appear
            planetListViewModel.fetchPlanets(till: paginationIndex)
        }
    }
}

struct PlanetListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListView()
    }
}
