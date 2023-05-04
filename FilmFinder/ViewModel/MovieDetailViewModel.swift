//
//  MovieDetailViewModel.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 25/4/23.
//

import Foundation

@MainActor class MovieDetailViewModel: ObservableObject {
    @Published var movie: MovieDetail?
    @Published var cast = [Cast]()
    private let service = WebService()
    
    func getMovieDetail(withId aMovieId: Int) async {
        let decodedResponse = await service.fetchMovieDetail(withMovieId: aMovieId)
        
        if let decodedResponse = decodedResponse {
            movie = decodedResponse
            await getMovieCast(withId: aMovieId)
        }
    }
    
    func getMovieCast(withId aMovieId: Int) async {
        var resultsCast = [Cast]()
        let decodedResponse = await service.fetchMovieCredits(withMovieId: aMovieId)
        if let decodedResponse = decodedResponse {            
            resultsCast = decodedResponse.cast ?? resultsCast
        }
        cast = resultsCast
    }
}
