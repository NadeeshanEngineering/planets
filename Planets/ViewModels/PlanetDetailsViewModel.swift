//
//  PlanetDetailsViewModel.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation

final class PlanetDetailsViewModel: ObservableObject {
    @Published var planet: Planet?
    @Published var image_url = Constants.IMAGE_URL_BASE + "0" + Constants.IMAGE_SIZE
    private let index: Int
    
    init(id: Int, planet: Planet?) {
        self.planet = planet
        self.index = id
        setupImageIconURL()
    }
    
    private func setupImageIconURL() {
        image_url = Constants.IMAGE_URL_BASE + "\(self.index)" + Constants.IMAGE_SIZE
    }
}
