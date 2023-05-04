//
//  Constants.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 18/4/23.
//

import CoreGraphics
import Foundation

class Constants {
    //MARK: - Api
    //MARK: ApiKey
    static let API_KEY:String = "e1d1e25da1c5f94277a4466e6d72b904"
    
    //MARK: BaseURL
    static let API_BASE_URL:String = "https://api.themoviedb.org/3/"
    static let API_BASE_URL_IMAGES:String = "https://image.tmdb.org/t/p/"
    
    //MARK: Image Sizes
    static let API_BASE_URL_DEFAULT_SIZE:String = "original"
    static let API_BASE_URL_BACKDROP_SIZE:String = "w780" // "backdrop_sizes": ["w300", "w780", "w1280", "original"]
    static let API_BASE_URL_POSTER_SIZE:String = "w342" // "poster_sizes": ["w92", "w154", "w185", "w342", "w500", "w780", "original"]
    static let API_BASE_URL_PROFILE_SIZE:String = "w185" // "profile_sizes": ["w45", "w185", "h632", "original"]
    
    //MARK: Paths
    static let API_PATH_MOVIE:String = "movie/"
    static let API_PATH_SEARCH:String = "search/movie"
    static let API_PATH_TOP_RATED:String = "top_rated"
    static let API_PATH_POPULAR:String = "popular"
    static let API_PATH_UPCOMING:String = "upcoming"
    static let API_PATH_LATEST:String = "latest"
    static let API_PATH_NOW_PLAYING:String = "now_playing"
    
    //MARK: QueryStrings
    static let API_QUERY_APPEND_CREDITS:String = "/credits"
    
    //MARK: - UI
    static let UI_MOVIE_GRID_LAYOUT_MIN:CGFloat = 140
    static let UI_MOVIE_GRID_LAYOUT_MAX:CGFloat = 300
    
}
