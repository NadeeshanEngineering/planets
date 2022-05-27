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
        KingFisherImageView(url: Constants.IMAGE_URL_BASE + "\(index)" + Constants.IMAGE_SIZE)
    }
}
