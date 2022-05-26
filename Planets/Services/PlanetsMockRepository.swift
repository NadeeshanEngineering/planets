//
//  PlanetsMockService.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation

protocol PlanetsMockRepositoryProtocal {
    func fetchPlanets(completion: @escaping (Result<[Planet], URLError>) -> Void)
}

final class PlanetsMockRepository: PlanetsMockRepositoryProtocal {
    final func fetchPlanets(completion: @escaping (Result<[Planet], URLError>) -> Void) {
        completion(.success([Planet(name: "Polis Massa", orbital_period: "590", climate: "artificial temperate ", gravity: "0.56 standard")]))
    }
}
