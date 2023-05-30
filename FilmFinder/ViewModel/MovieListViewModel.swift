//
//  MovieListViewModel.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 18/4/23.
//

import Foundation

@MainActor class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = [Movie]()
        
    private var currentPage = 1
    
    func getMovieList(fromTab aSelectedTab: TabType) async {
        let decodedResponse = await WebService.sharedInstance.fetchMovieList(withQueryType: .movieType, path: aSelectedTab, page: currentPage, searchText: "")
        
        if let decodedResponse = decodedResponse {
            for element in decodedResponse.results {
                if !movies.contains(element) { movies.append(element); }
            }
            
            if currentPage <= decodedResponse.totalPages {
                self.currentPage += 1
            }
        }
    }
}
