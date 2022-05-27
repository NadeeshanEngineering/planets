//
//  PlanetsRepository.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation

protocol PlanetsRepositoryProtocal {
    /**
     This is an abstract functinon to fecth the data from repository.

     Here is the discussion. This is an abstract functinon to fecth the data from repository. Hence this function must implement when a class extend **PlanetsRepositoryProtocal**.
     
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
    
    func fetchPlanets(till paginationIndex: Int, completion: @escaping (Result<[Planet], URLError>) -> Void)
}

final class PlanetsRepository: PlanetsRepositoryProtocal {
    private let service: PlanetsRepositoryProtocal
    
    /**
     This method is here to initiate the class.

     Here is the discussion. This method will initiate  the class while taking following paramers.

     - parameter service: Accept **PlanetsRepositoryProtocal** type objects to retrieve data using either MOCK or API.

     # Notes: #
     1. Parameters must be **PlanetsRepositoryProtocal** type

     # Example #
    ```
     let object = PlanetsRepository(service: PlanetsMockRepository())
     
     let object = PlanetsRepository(service: PlanetsApiService())
     ```
    */
    
    init(service: PlanetsRepositoryProtocal) {
        self.service = service
    }
    
    /**
     This is the abstract functinon that implemnted to fecth the data from repository.

     Here is the discussion. This is an abstract functinon to fecth the data from repository. Hence this function must implement when the class extend **PlanetsRepositoryProtocal**.
     
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
        service.fetchPlanets(till: paginationIndex, completion: completion)
    }
}
