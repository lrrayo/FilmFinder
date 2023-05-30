//
//  SearchView.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 21/4/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    let gridLayout = [
        GridItem(.adaptive(minimum: Constants.UI_MOVIE_GRID_LAYOUT_MIN, maximum: Constants.UI_MOVIE_GRID_LAYOUT_MAX))
    ]
    
    var body: some View {
        NavigationView {
            if networkMonitor.isConnected {
                if viewModel.searchText.isEmpty {
                    VStack {
                        Text("SearchViewTitle")
                            .font(.title.bold())
                        Text("SearchViewSubtitle")
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .foregroundColor(.secondary)
                    .navigationTitle("Search")
                } else {
                    ScrollView {
                        LazyVGrid(columns: gridLayout) {
                            ForEach(viewModel.searchMovies) { item in
                                MovieGridCellView(movie: item)
                                    .onAppear {
                                        if item == viewModel.searchMovies.last {
                                            Task {
                                                await viewModel.getSearchMovieList(searchText: viewModel.searchText)
                                            }
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                }
            } else {
                NoInternetConnectionView()
            }
            WelcomeView() //Just for large devices
        }
        .searchable(text: $viewModel.searchText)
        .onChange(of: viewModel.searchText) { textValue in
            viewModel.cancelSearch()
            Task {
                if textValue.count > 2 {
                    await viewModel.executeSearch(searchText: textValue)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
