//
//  PlanetsMockService.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation

final class PlanetsMockRepository: PlanetsRepositoryProtocal {
    
    /**
     This is the abstract functinon that implemnted to fecth the mock data.

     Here is the discussion. This is an abstract functinon to fecth the mock data. Hence this function must implement when the class extend **PlanetsRepositoryProtocal**.
     
     - parameter till: Current pagination index.
     - returns: Result object with the response from the given repository.

     # Notes: #
     1. Parameters must be **Int** type
     2. Handle return type because it receives both Success and Failure results.

     # Example #
    ```
     PlanetListViewModel().fetchPlanets(till: 0) { result in
         switch result {
         case .success(let response):
             print(response)
             break
         case .failure(let error):
             print("Error \(error)")
             break
         }
     }
     ```
    */
    
    func fetchPlanets(till paginationIndex: Int, completion: @escaping (Result<[Planet], URLError>) -> Void) {
        completion(.success([Planet(name: "Polis Massa", orbital_period: "590", climate: "artificial temperate ", gravity: "0.56 standard")]))
    }
}
