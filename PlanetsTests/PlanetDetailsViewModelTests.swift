//
//  PlanetDetailsViewModelTests.swift
//  PlanetsTests
//
//  Created by Nadeeshan Jayawardana on 2022-06-25.
//

import XCTest
@testable import Planets

class PlanetDetailsViewModelTests: XCTestCase {
    
    var sut: PlanetDetailsViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = PlanetDetailsViewModel(id: 5, planet: Planet(name: "Polis Massa", orbital_period: "590", climate: "artificial temperate ", gravity: "0.56 standard"))
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_PlanetDetailsView_setupImageIconURL_isCalledWithSuccess() {
        // Given
        // "index" variable inside the PlanetDetailsViewModel object is equal to '5'
        
        // When
        // "setupImageIconURL" function will call when initiate the "PlanetDetailsViewModel" object
        
        // Then
        XCTAssertEqual(sut.image_url, Constants.IMAGE_URL_BASE + "5" + Constants.IMAGE_SIZE)
    }
    
    func test_PlanetDetailsView_setupImageIconURL_isCalledWithFailed() {
        // Given
        // "index" variable inside the PlanetDetailsViewModel object is equal to '5'
        
        // When
        // "setupImageIconURL" function will call when initiate the "PlanetDetailsViewModel" object
        
        // Then
        XCTAssertNotEqual(sut.image_url, Constants.IMAGE_URL_BASE + "6" + Constants.IMAGE_SIZE)
    }
    
    func test_PlanetDetailsView_planetVariable_onInitWithSuccess() {
        
        // Given
        // "planet" variable inside the PlanetDetailsViewModel object is not nil
        
        // When
        // After initiate the "PlanetDetailsViewModel" object
        
        // Then
        XCTAssertNotNil(sut.planet)
    }
    
    func test_PlanetDetailsView_planetVariable_onInitWithFailed() {
        
        // Given
        sut = PlanetDetailsViewModel(id: 3, planet: nil)
        
        // When
        // After initiate the "PlanetDetailsViewModel" object
        
        // Then
        XCTAssertNil(sut.planet)
    }
}
