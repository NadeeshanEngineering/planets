//
//  PlanetsRepository.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation
import Combine

protocol PlanetsRepositoryProtocal {
    /**
     This is an abstract functinon to fecth the data from repository.

     Here is the discussion. This is an abstract functinon to fecth the data from repository. Hence this function must implement when a class extend **PlanetsRepositoryProtocal**.
     
     - parameter till: Current pagination index.
     - returns: AnyPublisher<Planets, Error> object with the response from the given repository.

     # Notes: #
     1. Parameters must be **Int** type
     2. Handle return type because it receives both Success and Failure results.

     # Example #
    ```
     ExamplePlanetsRepository().fetchPlanets(till: 0).sink { result in
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
    
    func fetchPlanets(till paginationIndex: Int) -> AnyPublisher<Planets, Error>
}
