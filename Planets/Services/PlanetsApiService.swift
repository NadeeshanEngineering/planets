//
//  PlanetsApiService.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation
import Combine

final class PlanetsApiService: PlanetsRepositoryProtocal {
    
    /**
     This is the abstract functinon that implemnted to fecth the data from API.

     Here is the discussion. This is an abstract functinon to fecth the data from API. Hence this function must implement when the class extend **PlanetsRepositoryProtocal**.
     
     - parameter till: Current pagination index.
     - returns: AnyPublisher<Planets, Error> object with the response from the given repository.

     # Notes: #
     1. Parameters must be **Int** type
     2. Handle return type because it receives both Success and Failure results.

     # Example #
    ```
     PlanetsApiService().fetchPlanets(till: 0).sink { result in
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
        guard let url = URL(string: Constants.BASE_URL + "?page=\(paginationIndex)") else {
            return Fail(error: URLError(.cannotFindHost)).eraseToAnyPublisher()
        }
        
        // MARK: Fetch data from API
        return URLSession.call(for: url, format: Planets.self)
    }
}
