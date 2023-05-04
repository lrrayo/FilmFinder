//
//  Credits.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 27/4/23.
//

import Foundation

// MARK: - Credits
struct Credits: Codable {
    let id: Int
    let cast, crew: [Cast]?
}

// MARK: - Cast
struct Cast: Codable, Identifiable {
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: String?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castID: Int?
    let character, creditID: String?
    let order: Int?
    let department: String?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
    
    // MARK: Optionals resolved
    var iAdult: Bool {
        get { adult ?? false }
    }

    var iGender: Int {
        get { gender ?? -1 }
    }

    var iId: Int {
        get { id ?? -1 }
    }
    
    var iKnownForDepartment: String {
        get { knownForDepartment ?? "" }
    }

    var iName: String {
        get { name ?? "" }
    }

    var iOriginalName: String {
        get { originalName ?? "" }
    }

    var iPopularity: Double {
        get { popularity ?? -1 }
    }

    var iProfilePath: String {
        get { profilePath ?? "" }
    }

    var iCastID: Int {
        get { castID ?? -1 }
    }

    var iCharacter: String {
        get { character ?? "" }
    }

    var iCreditID: String {
        get { creditID ?? "" }
    }

    var iOrder: Int {
        get { order ?? -1 }
    }
    
    var iDepartment: String {
        get { department ?? "" }
    }

    var iJob: String {
        get { job ?? "" }
    }
}

enum Department: String, Codable {
    case acting = "Acting"
    case art = "Art"
    case camera = "Camera"
    case costumeMakeUp = "Costume & Make-Up"
    case crew = "Crew"
    case directing = "Directing"
    case editing = "Editing"
    case lighting = "Lighting"
    case production = "Production"
    case sound = "Sound"
    case visualEffects = "Visual Effects"
    case writing = "Writing"
    case none = ""
}
