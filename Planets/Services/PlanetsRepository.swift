//
//  PlanetsRepository.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation

protocol PlanetsRepositoryProtocal {
    func fetchPlanets(till paginationIndex: Int, completion: @escaping (Result<[Planet], URLError>) -> Void)
}

final class PlanetsRepository: PlanetsRepositoryProtocal {
    private let apiService: PlanetsApiServiceProtocal?
    private let mockService: PlanetsMockRepositoryProtocal?
    
    init(apiService: PlanetsApiServiceProtocal) {
        self.apiService = apiService
        self.mockService = nil
    }
    
    init(mockService: PlanetsMockRepositoryProtocal) {
        self.apiService = nil
        self.mockService = mockService
    }
    
    final func fetchPlanets(till paginationIndex: Int, completion: @escaping (Result<[Planet], URLError>) -> Void) {
        if let apiService = self.apiService {
            apiService.fetchPlanets(till: paginationIndex, completion: completion)
            return
        }
        
        if let mockService = self.mockService {
            mockService.fetchPlanets(completion: completion)
            return
        }
    }
}
