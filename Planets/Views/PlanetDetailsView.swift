//
//  PlanetDetailsView.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation
import SwiftUI

struct PlanetDetailsView: View {
    let index: Int
    let planet: Planet
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            KingFisherImageView(url: Constants.IMAGE_URL_BASE + "\(index)" + Constants.IMAGE_SIZE)
            detailTextView(title: "Name", value: planet.name)
            detailTextView(title: "Orbital Period", value: planet.orbital_period)
            detailTextView(title: "Gravity", value: planet.gravity)
            Spacer()
        }
    }
}
