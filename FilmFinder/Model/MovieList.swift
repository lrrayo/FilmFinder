//
//  MovieList.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 18/4/23.
//

import Foundation

struct MovieList: Codable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
