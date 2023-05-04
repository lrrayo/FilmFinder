//
//  MovieDetailView.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 25/4/23.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel = MovieDetailViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    @State private var showNetworkAlert = false
    
    let movieId: Int
    
    var body: some View {
        ScrollView {
            VStack {
                if let movie = viewModel.movie {
                    AsyncImageView(imageType: .backdrop, imagePath: movie.iBackdropPath)
                    VStack (alignment: .leading) {
                        HStack {
                            Text(movie.iTitle)
                                .font(.title).bold()
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                            ZStack {
                                CircularVoteView(votes: movie.iVoteAverage)
                                    .padding(5)
                                    .frame(width: 60, height: 60)
                            }
                        }
                        
                        Divider()
                        
                        Group {
                            Text(movie.iReleaseDate) + Text(" - ") + Text("\(movie.iRuntime) min")
                            
                            HStack() {
                                Text(movie.iGenresNames.joined(separator: " · ")).foregroundColor(.secondary)
                                Spacer()
                                if movie.iAdult {
                                    Image(systemName: "18.circle").foregroundColor(.secondary)
                                }
                            }
                            Text("MovieDetailOverview").font(.title2)
                            Text(movie.iOverview)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.vertical, 5)
                        
                        Text("MovieDetailCast").font(.title2)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach (viewModel.cast) { member in
                                    CastGridCellView(member: member)
                                }
                            }
                            .frame(height: 400)
                        }
                    }
                    .padding()
                } else {
                    VStack {
                        Spacer()
                        Text("ErrorLoadingMovie")
                        Spacer()
                    }
                    
                }
            }
            .navigationTitle(viewModel.movie?.iTitle ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.getMovieDetail(withId: movieId)
            }
            .onChange(of: networkMonitor.isConnected) { connection in
                showNetworkAlert = connection == false
            }
            .alert(
                "NetworkManagerNoInternetAlert",
                isPresented: $showNetworkAlert
            ) {}
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieId: 640146)
    }
}
