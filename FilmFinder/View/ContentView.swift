//
//  ContentView.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 17/4/23.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        TabView {
            MovieListView(tabType: .popular)
                .tabItem {
                    Label("TabItemPopular", systemImage: "hands.clap" )
                }
            MovieListView(tabType: .topRated)
                .tabItem {
                    Label("TabItemBestRated", systemImage: "star")
                }
            MovieListView(tabType: .newPlaying)
                .tabItem {
                    Label("TabItemNewPlaying", systemImage: "film")
                }
            MovieListView(tabType: .upcoming)
                .tabItem {
                    Label("TabItemUpcoming", systemImage: "calendar.badge.clock")
                }
            SearchView()
                .tabItem {
                    Label("TabItemDiscover", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
