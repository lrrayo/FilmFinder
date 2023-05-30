//
//  WebService+Movie.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 30/5/23.
//

import Foundation

///Primary API service to get all movie data
extension WebService {
    
    ///Fetch Movie list API call
    func fetchMovieList(withQueryType aQueryType: QueryType, path aPath: TabType, page aCurrentPage: Int, searchText aSearchText: String) async -> MovieList? {
        
        guard let url = getDataQuery(withQueryType: aQueryType, path: aPath, page: aCurrentPage, searchText: aSearchText) else {
            print("Failed To Create Request")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decodedResponse = try JSONDecoder().decode(MovieList.self, from: data)
            return decodedResponse
    
        } catch {
            print("Invalid data fetching movie list: \(error.localizedDescription)")
        }
        return nil
    }
    
    ///Fetch single Movie detail API call
    func fetchMovieDetail(withMovieId aMovieId: Int) async -> MovieDetail? {
        
        guard let url = getDetailQuery(withMovieId: aMovieId, andGetCredits: false) else {
            print("Failed To Create Request")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decodedResponse = try JSONDecoder().decode(MovieDetail.self, from: data)
            return decodedResponse
    
        } catch {
            print("Invalid data fetching movie detail: \(error.localizedDescription)")
        }
        return nil
    }
    
    ///Fetch single Movie credits API call
    func fetchMovieCredits(withMovieId aId: Int) async -> Credits? {
        guard let url = getDetailQuery(withMovieId: aId, andGetCredits: true) else {
            print("Failed To Create Request")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decodedResponse = try JSONDecoder().decode(Credits.self, from: data)
            return decodedResponse
    
        } catch {
            print("Invalid data fetching movie credits: \(error)")
        }
        return nil
    }
}
