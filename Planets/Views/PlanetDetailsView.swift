//
//  PlanetDetailsView.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation
import SwiftUI

struct PlanetDetailsView: View {
    
    let planet: Planet
    
    var body: some View {
        Text("This is the detail view of \(planet.name)")
    }
}
