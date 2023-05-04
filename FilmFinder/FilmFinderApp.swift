//
//  FilmFinderApp.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 17/4/23.
//

import SwiftUI

@main
struct FilmFinderApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkMonitor)
        }
    }
}
