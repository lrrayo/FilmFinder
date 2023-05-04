//
//  MovieDetail.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 18/4/23.
//

import Foundation
import SwiftUI

struct MovieDetail: Codable {
    var adult: Bool?
    var backdropPath: String?
    var budget: Int?
    var genres: [Genre]?
    var homepage: String?
    var id: Int?
    var imdbID: String?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String?
    var releaseDate: String?
    var revenue: Int?
    var runtime: Int?
    var status: String? //Rumored, Planned, In Production, Post Production, Released, Canceled
    var tagline: String?
    var title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime, status, tagline, title, video
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
    
    var iBudget: Int {
        get { budget ?? -1 }
        set { budget = newValue }
    }
    
    var iGenres: [Genre] {
        get { genres ?? [Genre]() }
        set { genres = newValue }
    }
    
    var iGenresNames: [String] {
        var names = [String]()
        for item in iGenres {
            names.append(item.iName)
        }
        return names
    }
    
    var iHomepage: String {
        get { homepage ?? "" }
        set { homepage = newValue }
    }
    
    var iId: Int {
        get { id ?? -1 }
        set { id = newValue }
    }
    
    var iImdbID: String {
        get { imdbID ?? "" }
        set { imdbID = newValue }
    }
    
    var iOriginalLanguage: String {
        get { originalLanguage ?? "" }
        set { originalLanguage = newValue }
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
            return date?.formatted(date: .long, time: .omitted) ?? "N/A"
        }
        set { releaseDate = newValue }
    }
    
    var iRevenue: Int {
        get { revenue ?? -1 }
        set { revenue = newValue }
    }
    
    var iRuntime: Int {
        get { runtime ?? -1 }
        set { runtime = newValue }
    }
    
    var iStatus: String {
        get { status ?? "" }
        set { status = newValue }
    }
    var iTagline: String {
        get { tagline ?? "" }
        set { tagline = newValue }
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
