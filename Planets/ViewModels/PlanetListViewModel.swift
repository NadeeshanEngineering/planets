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
    
    init(repository: PlanetsRepositoryProtocal = PlanetsRepository(apiService: PlanetsApiService())) {
        self.repository = repository
    }
    
    func fetchPlanets(till paginationIndex: Int) {
        DispatchQueue.main.async {
            self.repository.fetchPlanets(till: paginationIndex) { result in
                switch result {
                case .success(let planets):
                    self.planets += planets
                    break
                case .failure(let error):
                    print("Error \(error)")
                    break
                }
            }
        }
    }
}
