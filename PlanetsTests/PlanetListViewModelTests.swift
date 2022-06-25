//
//  PlanetListViewModelTests.swift
//  PlanetListViewModelTests
//
//  Created by Nadeeshan Jayawardana on 2022-06-25.
//

import XCTest
import Combine
@testable import Planets

class PlanetListViewModelTests: XCTestCase {
    
    var sut: PlanetListViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = PlanetListViewModel(repository: PlanetsMockRepository())
    }
    
    func testFetchPlanets_onAppearWithSuccessAPI_isCalled() {
        let expectation = self.expectation(description: "Waiting for the fetchPlanets function to complete.")
        
        // Given
        let index = 1
        
        // When
        sut.fetchPlanets(till: index) { _ in
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2) { error in
            XCTAssertNil(error)
            // Then
            XCTAssertFalse(self.sut.planets.isEmpty)
        }
    }
    
    func testFetchPlanets_onAppearWithFailedAPI_isCalled() {
        let expectation = self.expectation(description: "Waiting for the fetchPlanets function to complete.")
        
        // Given
        let index = 0
        
        // When
        sut.fetchPlanets(till: index) { _ in
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2) { error in
            XCTAssertNil(error)
            // Then
            XCTAssertTrue(self.sut.planets.isEmpty)
        }
    }
}
