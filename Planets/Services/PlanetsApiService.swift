//
//  PlanetsApiService.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation
import Combine

final class PlanetsApiService: PlanetsRepositoryProtocal {
    private(set) var cancellables = Set<AnyCancellable>()
    
    /**
     This is the abstract functinon that implemnted to fecth the data from API.

     Here is the discussion. This is an abstract functinon to fecth the data from API. Hence this function must implement when the class extend **PlanetsRepositoryProtocal**.
     
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
    
    final func fetchPlanets(till paginationIndex: Int, completion: @escaping (Result<[Planet], URLError>) -> Void) {
        guard let url = URL(string: Constants.BASE_URL + "?page=\(paginationIndex)") else {
            completion(.failure(URLError(.cannotFindHost)))
            return
        }
        
        // MARK: Fetch data from API
        DispatchQueue.global(qos: .background).async { [self] in
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
}
