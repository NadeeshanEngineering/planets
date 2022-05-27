//
//  PlanetDetailsView.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation
import SwiftUI

struct PlanetDetailsView: View {
    @StateObject var planetDetailsViewModel = PlanetDetailsViewModel(id: 1, planet: nil)
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            KingFisherImageView(url: planetDetailsViewModel.image_url)
            detailTextView(title: "Name", value: planetDetailsViewModel.planet?.name ?? "N/A")
            detailTextView(title: "Orbital Period", value: planetDetailsViewModel.planet?.orbital_period ?? "N/A")
            detailTextView(title: "Gravity", value: planetDetailsViewModel.planet?.gravity ?? "N/A")
            Spacer()
        }
    }
}
