//
//  PlanetListViewModel.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation
import Combine

final class PlanetListViewModel: ObservableObject {
    @Published var planets = [Planet]()
    private var cancellables = Set<AnyCancellable>()
    private let repository: PlanetsRepositoryProtocal
    
    /**
     This method is here to initiate current view.

     Here is the discussion. This method will initiate the current view while taking following paramers.

     - parameter repository: To retrieve data using either MOCK or API.

     # Notes: #
     1. Parameters must be **PlanetsRepositoryProtocal** type

     # Example #
    ```
     let object = PlanetListViewModel(repository: PlanetsMockRepository())
     
     let object = PlanetListViewModel(repository: PlanetsApiService())
     ```
    */
    
    init(repository: PlanetsRepositoryProtocal = PlanetsApiService()) {
        self.repository = repository
    }
    
    /**
     This method is here to get data from MOCK or API.

     Here is the discussion. This method takes current pagination index and return a Result object with the response from the given repository.

     - parameter till: Current pagination index.
     - returns: Result object with the response from the given repository.

     # Notes: #
     1. Parameters must be **Int** type
     2. Handle return type because it receives both Success and Failure results.

     # Example #
    ```
     PlanetListViewModel().fetchPlanets(till: 0)
     ```
    */
    
    func fetchPlanets(till paginationIndex: Int) {
        self.repository.fetchPlanets(till: paginationIndex).sink { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            default:
                print("completed")
            }
        } receiveValue: { planets in
            DispatchQueue.main.async {
                self.planets += planets.results
            }
        }.store(in: &cancellables)
    }
}
