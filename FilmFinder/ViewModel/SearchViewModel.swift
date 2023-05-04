//
//  SearchViewModel.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 21/4/23.
//

import Combine
import Foundation

@MainActor class SearchViewModel: ObservableObject {
    @Published var searchMovies: [Movie] = [Movie]()
    @Published var searchText = ""
        
    private let service = WebService()
    
    var currentPage = 1
    private var searchTask: Task<Void, Never>?
    
    func executeSearch(searchText aSearchText: String) async {
        searchTask?.cancel()
        searchTask = Task {
            await getSearchMovieList(searchText: aSearchText)
        }
    }
    
    func cancelSearch() {
        searchTask?.cancel()
        searchTask = nil
        currentPage = 1
        searchMovies.removeAll()
    }
    
    func getSearchMovieList(searchText aSearchText: String) async {
        let decodedResponse = await service.fetchMovieList(withQueryType: .searchType, path: .searching, page: currentPage, searchText: aSearchText)
        if let decodedResponse = decodedResponse {
            
            for element in decodedResponse.results {
                if !searchMovies.contains(element) { searchMovies.append(element); }
            }
            
            if currentPage <= decodedResponse.totalPages {
                self.currentPage += 1
            }
        }
    }
}
