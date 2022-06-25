//
//  PlanetsMockService.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation
import Combine

final class PlanetsMockRepository: PlanetsRepositoryProtocal {
    
    /**
     This is the abstract functinon that implemnted to fecth the mock data.

     Here is the discussion. This is an abstract functinon to fecth the mock data. Hence this function must implement when the class extend **PlanetsRepositoryProtocal**.
     
     - parameter till: Current pagination index.
     - returns: AnyPublisher<Planets, Error> object with the response from the given repository.

     # Notes: #
     1. Parameters must be **Int** type
     2. Handle return type because it receives both Success and Failure results.

     # Example #
    ```
     PlanetsMockRepository().fetchPlanets(till: 0).sink { result in
         switch result {
         case .failure(let error):
             print(error.localizedDescription)
         default:
             print("completed")
         }
     } receiveValue: { planets in
             print(planets)
     }.store(in: &cancellables)
     ```
    */
    
    final func fetchPlanets(till paginationIndex: Int) -> AnyPublisher<Planets, Error> {
        return paginationIndex > 0 ? Just(Planets(count: 1, next: nil, previous: nil, results: [Planet(name: "Polis Massa", orbital_period: "590", climate: "artificial temperate ", gravity: "0.56 standard")]))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher() : Fail(error: NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey : "Invalid API response"])).eraseToAnyPublisher()
    }
}
