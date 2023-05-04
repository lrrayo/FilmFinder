//
//  FilmFinderTests.swift
//  FilmFinderTests
//
//  Created by Laura Riera Rayo on 2/5/23.
//

import Foundation
import XCTest
@testable import FilmFinder

@MainActor class FilmFinderTests: XCTestCase {
    
    var movieListViewModel: MovieListViewModel?
    var searchViewModel: SearchViewModel?
    var webService: WebService?
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        movieListViewModel = MovieListViewModel()
        searchViewModel = SearchViewModel()
        webService = WebService()
    }
    
    @MainActor override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        movieListViewModel = nil
        searchViewModel = nil
        webService = nil
    }
    
    func test_MovieListViewModel_movies_shouldBeEmpty() {
        //Given
        guard let vm = movieListViewModel else {
            XCTFail()
            return
        }
        
        //When
        
        //Then
        XCTAssertTrue(vm.movies.isEmpty)
        XCTAssertEqual(vm.movies.count, 0)
    }
    
    @MainActor func test_SearchViewModel_searchMovies_shouldBeEmpty() {
        //Given
        guard let vm = searchViewModel else {
            XCTFail()
            return
        }
        
        //When
        
        //Then
        XCTAssertTrue(vm.searchMovies.isEmpty)
        XCTAssertEqual(vm.searchMovies.count, 0)
        XCTAssertEqual(vm.searchText, "")
    }
    
    func test_MovieListViewModel_movies_shouldHaveValues() async {
        //Given
        guard let vm = movieListViewModel else {
            XCTFail()
            return
        }
        
        for tab in TabType.allCases {
            //When
            if tab != .searching {
                await vm.getMovieList(fromTab: tab)
                
                //Then
                XCTAssertNotNil(vm.movies)
                XCTAssertFalse(vm.movies.isEmpty)
            }
        }
    }
    
    func test_SearchViewModel_searchMovies_shouldHaveValues() async {
        //Given
        guard let vm = searchViewModel else {
            XCTFail()
            return
        }
        
        //When
        let searchTerm = "Alien"
        await vm.getSearchMovieList(searchText: searchTerm)
        
        //Then
        XCTAssertNotNil(vm.searchMovies)
        XCTAssertGreaterThan(vm.searchMovies.count, 0)
    }
    
    func test_WebService_getDataQuery_popular() {
        //Given
        guard let ws = webService else {
            XCTFail()
            return
        }
        
        let queryType: QueryType = .movieType
        let path: TabType = .popular
        let page = 1
        let searchText = ""
        
        //When
        let url = ws.getDataQuery(withQueryType: queryType, path: path, page: page, searchText: searchText)
        
        //Then
        XCTAssertEqual(url?.absoluteString, "https://api.themoviedb.org/3/movie/popular?api_key=e1d1e25da1c5f94277a4466e6d72b904&language=es&region=ES&page=1")
    }
    
    func test_WebService_getImageQuery() {
        //Given
        guard let ws = webService else {
            XCTFail()
            return
        }
        
        let imageType: ImageType = .poster
        let path = "/hR1jdCw0A9czgsbp45TASkjjBhA.jpg"
        
        //When
        let url = ws.getImageQuery(withImageType: imageType, andPath: path)
        
        //Then
        XCTAssertEqual(url?.absoluteString, "https://image.tmdb.org/t/p/w342/hR1jdCw0A9czgsbp45TASkjjBhA.jpg?language=es")
    }
}
