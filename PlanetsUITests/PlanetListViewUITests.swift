//
//  PlanetsUITests.swift
//  PlanetsUITests
//
//  Created by Nadeeshan Jayawardana on 2022-06-25.
//

import XCTest

class PlanetListViewUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_PlanetListView_tableView_clickOnTableCell() {
        
        let table = app.tables.element(boundBy: 0)
        let planetDetailsViewNavigationBarBackButton = app.navigationBars.buttons.element(boundBy: 0)
        
        table.cells.element(boundBy: 0).tap()
        planetDetailsViewNavigationBarBackButton.tap()
        table.cells.element(boundBy: 3).tap()
        planetDetailsViewNavigationBarBackButton.tap()
        table.cells.element(boundBy: 5).tap()
        planetDetailsViewNavigationBarBackButton.tap()
        table.cells.element(boundBy: 8).tap()
        planetDetailsViewNavigationBarBackButton.tap()
    }
}
