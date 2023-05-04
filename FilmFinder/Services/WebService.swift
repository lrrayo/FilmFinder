//
//  WebService.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 18/4/23.
//

import Foundation
import SwiftUI

enum QueryType {
    case movieType, searchType, imageType
}

enum TabType: CaseIterable {
    case popular, topRated, newPlaying, upcoming, searching
}

enum ImageType {
    case original, poster, backdrop, profile
}

class WebService {
    
    // MARK: - Movie List
    func fetchMovieList(withQueryType aQueryType: QueryType, path aPath: TabType, page aCurrentPage: Int, searchText aSearchText: String) async -> MovieList? {
        
        guard let url = getDataQuery(withQueryType: aQueryType, path: aPath, page: aCurrentPage, searchText: aSearchText) else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decodedResponse = try JSONDecoder().decode(MovieList.self, from: data)
            return decodedResponse
    
        } catch {
            print("Invalid data: \(error.localizedDescription)")
        }
        return nil
    }
    
    func getDataQuery(withQueryType aQueryType: QueryType, path aPath: TabType, page aPage: Int, searchText aSearchText: String) -> URL? {
        var baseUrl = ""
        
        switch aQueryType {
        case .movieType:
            baseUrl += Constants.API_BASE_URL //https://api.themoviedb.org/3/
            baseUrl += Constants.API_PATH_MOVIE //https://api.themoviedb.org/3/movie/
            baseUrl += getPathType(aPath: aPath) //https://api.themoviedb.org/3/movie/popular
            break
        case .searchType:
            baseUrl += Constants.API_BASE_URL
            baseUrl += Constants.API_PATH_SEARCH //https://api.themoviedb.org/3/search/movie
            break
        case .imageType:
            baseUrl += Constants.API_BASE_URL_IMAGES //https://image.tmdb.org/t/p/
            break
        }
        
        var urlComponents = URLComponents(string: baseUrl)
        
        if aQueryType == .movieType || aQueryType == .searchType {
            var queryItems = [
                URLQueryItem(name: "api_key", value: Constants.API_KEY),
                URLQueryItem(name: "language", value: Locale.current.languageCode),
                URLQueryItem(name: "region", value: Locale.current.regionCode),
                URLQueryItem(name: "page", value: String(aPage))
            ]
            
            if !aSearchText.isEmpty {
                queryItems.append(URLQueryItem(name: "query", value: aSearchText))
            }
            
            urlComponents?.queryItems = queryItems
        }
        
        return urlComponents?.url
    }
    
    func getPathType(aPath: TabType) -> String {
        switch aPath {
        case .popular:
            return Constants.API_PATH_POPULAR
        case .topRated:
            return Constants.API_PATH_TOP_RATED
        case .newPlaying:
            return Constants.API_PATH_NOW_PLAYING
        case .upcoming:
            return Constants.API_PATH_UPCOMING
        case .searching:
            return ""
        }
    }

    // MARK: - Images
    func getImageQuery(withImageType aImageType: ImageType, andPath aFilePath: String) -> URL? {
        var url = Constants.API_BASE_URL_IMAGES //https://image.tmdb.org/t/p/
        
        switch aImageType {
        case .original:
            url += Constants.API_BASE_URL_DEFAULT_SIZE
        case .poster:
            url += Constants.API_BASE_URL_POSTER_SIZE //https://image.tmdb.org/t/p/w342
        case .backdrop:
            url += Constants.API_BASE_URL_BACKDROP_SIZE
        case .profile:
            url += Constants.API_BASE_URL_PROFILE_SIZE
        }

        url += aFilePath //https://image.tmdb.org/t/p/w342/hR1jdCw0A9czgsbp45TASkjjBhA.jpg
        
        var urlComponents = URLComponents(string: url)
        urlComponents?.queryItems = [
            URLQueryItem(name: "language", value: Locale.current.languageCode)
        ]

        return urlComponents?.url
    }
    
    // MARK: - Movie Details
    func fetchMovieDetail(withMovieId aMovieId: Int) async -> MovieDetail? {
        
        guard let url = getDetailQuery(withMovieId: aMovieId) else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decodedResponse = try JSONDecoder().decode(MovieDetail.self, from: data)
            return decodedResponse
    
        } catch {
            print("Invalid data: \(error.localizedDescription)")
        }
        return nil
    }
    
    func getDetailQuery(withMovieId aMovieId: Int) -> URL? { //https://api.themoviedb.org/3/movie/103578?api_key=e1d1e25da1c5f94277a4466e6d72b904&language=en-US
        var baseUrl = ""
        
        baseUrl += Constants.API_BASE_URL //https://api.themoviedb.org/3/
        baseUrl += Constants.API_PATH_MOVIE //https://api.themoviedb.org/3/movie/
        baseUrl += "\(aMovieId)" //https://api.themoviedb.org/3/movie/103578"
        
        var urlComponents = URLComponents(string: baseUrl)
        let queryItems = [
            URLQueryItem(name: "api_key", value: Constants.API_KEY),
            URLQueryItem(name: "language", value: Locale.current.languageCode)
        ]
        
        urlComponents?.queryItems = queryItems
                
        return urlComponents?.url
    }
    
    // MARK: - Movie Credits
    func fetchMovieCredits(withMovieId aId: Int) async -> Credits? {
        guard let url = getCreditsQuery(withMovieId: aId) else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decodedResponse = try JSONDecoder().decode(Credits.self, from: data)
            return decodedResponse
    
        } catch {
            print("Error decoding: \(error)")
        }
        return nil
    }
    
    func getCreditsQuery(withMovieId aMovieId: Int) -> URL? { //https://api.themoviedb.org/3/movie/640146/credits?api_key=e1d1e25da1c5f94277a4466e6d72b904&language=en-US
        var baseUrl = ""
        
        baseUrl += Constants.API_BASE_URL //https://api.themoviedb.org/3/
        baseUrl += Constants.API_PATH_MOVIE //https://api.themoviedb.org/3/movie/
        baseUrl += "\(aMovieId)" //https://api.themoviedb.org/3/movie/640146"
        baseUrl += Constants.API_QUERY_APPEND_CREDITS //https://api.themoviedb.org/3/movie/640146/credits
        
        var urlComponents = URLComponents(string: baseUrl)
        let queryItems = [
            URLQueryItem(name: "api_key", value: Constants.API_KEY),
            URLQueryItem(name: "language", value: Locale.current.languageCode),
        ]
        
        urlComponents?.queryItems = queryItems
            
        return urlComponents?.url
    }
}
