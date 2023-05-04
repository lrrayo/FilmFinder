//
//  MovieListViewUITest.swift
//  FilmFinderUITests
//
//  Created by Laura Riera Rayo on 2/5/23.
//

import XCTest

class MovieListViewUITest: XCTestCase {

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
    
    func test_ContentView_TabView_popularTabSelected() {
        //Given
        let tabView = app.tabBars.element
        let tab = tabView.buttons["Populares"]
        let navBar = app.navigationBars["Populares"]
        
        //When
        
        //Then
        XCTAssertTrue(tab.isSelected)
        XCTAssertTrue(navBar.exists)
    }

    func test_ContentView_TabView_shouldNavigateToBestRatedMovieListView() {
        //Given
        let tabView = app.tabBars.element
        let tab = tabView.buttons["Mejor valoradas"]
        
        //When
        tab.tap()
        
        //Then
        let navBar = app.navigationBars["Mejor valoradas"]
        XCTAssertTrue(navBar.exists)
    }
    
    func test_ContentView_TabView_shouldNavigateToSerchView() {
        //Given
        let tabView = app.tabBars.element
        let tab = tabView.buttons["Descubre"]
        
        //When
        tab.tap()
        
        let navBar = app.navigationBars["Buscar"]
        let searchTextField = app.searchFields.element
        
        //Then
        XCTAssertTrue(navBar.exists)
        XCTAssertTrue(searchTextField.exists)
    }
    
    func test_MovieDetailView_Image_shouldExist() {
        //Given
        let scrollView = app.scrollViews.element
        
        //When
        scrollView.staticTexts.firstMatch.tap()
        
        let detailImage = app.images.firstMatch
        let detailTitle = app.staticTexts.firstMatch
        
        //Then
        XCTAssertTrue(detailImage.exists)
        XCTAssertTrue(detailTitle.exists)
        
    }

}
