//
//  PlanetsApiService.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation
import Combine

protocol PlanetsApiServiceProtocal {
    func fetchPlanets(completion: @escaping (Result<[Planet], URLError>) -> Void)
}

final class PlanetsApiService: PlanetsApiServiceProtocal {
    private var cancellables = Set<AnyCancellable>()
    
    final func get() -> Set<AnyCancellable> {
        return cancellables
    }
    
    final func fetchPlanets(completion: @escaping (Result<[Planet], URLError>) -> Void) {
        guard let url = URL(string: Constants.BASE_URL + "?page=2") else {
            completion(.failure(URLError(.cannotFindHost)))
            return
        }
        
        cancellables.insert(URLSession.call(for: url, format: Planets.self, completion: { response in
            switch response {
            case .success(let planets):
                completion(.success(planets.results))
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }))
    }
}
