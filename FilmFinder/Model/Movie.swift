//
//  Movie.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 17/4/23.
//

import Foundation

struct Movie: Codable, Identifiable, Equatable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalTitle: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    // MARK: - Optionals resolved
    var iAdult: Bool {
        get { adult ?? false }
        set { adult = newValue }
    }
    
    var iBackdropPath: String {
        get { backdropPath ?? "" }
        set { backdropPath = newValue }
    }
    
    var iGenreIDS: [Int] {
        get { genreIDS ?? [Int]() }
        set { genreIDS = newValue }
    }
    
    var iId: Int {
        get { id ?? -1 }
        set { id = newValue }
    }
    
    var iOriginalTitle: String {
        get { originalTitle ?? "" }
        set { originalTitle = newValue }
    }
    
    var iOverview: String {
        get { overview ?? "No information" }
        set { overview = newValue }
    }
    
    var iPopularity: Double {
        get { popularity ?? -1 }
        set { popularity = newValue }
    }
    
    var iPosterPath: String {
        get { posterPath ?? "" }
        set { posterPath = newValue }
    }
    
    var iReleaseDate: String {
        get {
            var date: Date? = nil
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let releaseDate = releaseDate {
                date = dateFormatter.date(from: releaseDate) ?? nil
            }
            return date?.formatted(date: .numeric, time: .omitted) ?? "N/A"
        }
        set { releaseDate = newValue }
    }
    
    var iTitle: String {
        get { title ?? "" }
        set { title = newValue }
    }
    
    var iVideo: Bool {
        get { video ?? false }
        set { video = newValue }
    }
    
    var iVoteAverage: Double {
        get { voteAverage ?? -1 }
        set { voteAverage = newValue }
    }
    
    var iVoteCount: Int {
        get { voteCount ?? -1 }
        set { voteCount = newValue }
    }
}
