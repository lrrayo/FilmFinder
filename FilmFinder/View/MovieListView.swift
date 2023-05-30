//
//  MovieListView.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 18/4/23.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var viewModel = MovieListViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    let tabType: TabType
    
    var navigationTitle: LocalizedStringKey {
        switch tabType {
        case .popular:
            return "TabItemPopular"
        case .topRated:
            return "TabItemBestRated"
        case .newPlaying:
            return "TabItemNewPlaying"
        case .upcoming:
            return "TabItemUpcoming"
        case .searching:
            return "TabItemDiscover"
        }
    }
    
    let gridLayout = [
        GridItem(.adaptive(minimum: Constants.UI_MOVIE_GRID_LAYOUT_MIN, maximum: Constants.UI_MOVIE_GRID_LAYOUT_MAX))
    ]
    
    //MARK: - Body View
    var body: some View {
        NavigationView {
            if networkMonitor.isConnected {
                ScrollView {
                    LazyVGrid(columns: gridLayout) {
                        ForEach(viewModel.movies) { item in
                            MovieGridCellView(movie: item)
                                .onAppear {
                                    if item == viewModel.movies.last {
                                        Task {
                                            await viewModel.getMovieList(fromTab: tabType)
                                        }
                                    }
                                }
                        }
                    }
                    .padding()
                }
                .task {
                    await viewModel.getMovieList(fromTab: tabType)
                }
                .navigationTitle(navigationTitle)
            } else {
                NoInternetConnectionView()
                    .navigationTitle(navigationTitle)
            }
            
            WelcomeView() //just for large devices
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(tabType: .popular)
    }
}
