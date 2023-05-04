//
//  Genre.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 18/4/23.
//

import Foundation

struct Genre: Codable, Identifiable {
    let id: Int?
    let name: String?
    
    // MARK: - Optionals resolved
    var iId: Int {
        get { id ?? -1 }
    }
    
    var iName: String {
        get { name ?? "" }
    }
}
