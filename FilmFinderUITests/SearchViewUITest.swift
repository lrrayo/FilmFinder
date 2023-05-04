//
//  SearchViewUITest.swift
//  FilmFinderUITests
//
//  Created by Laura Riera Rayo on 3/5/23.
//

import XCTest

class SearchViewUITest: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_SearchView_searchField_shouldSearch() {
        //Given
        let tabView = app.tabBars.element
        let tab = tabView.buttons["Descubre"]
        
        //When
        tab.tap()
        
        let welcomeText = app.staticTexts["Encuentra tu película"]
                
        let searchTextField = app.searchFields.element
        searchTextField.tap()
        app.keys["A"].tap()
        app.keys["l"].tap()
        app.keys["i"].tap()
        app.keys["e"].tap()
        app.keys["n"].tap()
        //Then
        XCTAssertEqual(searchTextField.value as! String, "Alien")
        XCTAssertFalse(welcomeText.exists)
    }

}
