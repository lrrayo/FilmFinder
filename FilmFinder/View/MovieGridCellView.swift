//
//  MovieGridCellView.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 21/4/23.
//

import SwiftUI

struct MovieGridCellView: View {
    var movie: Movie
    
    var body: some View {
        NavigationLink {
            MovieDetailView(movieId: movie.iId)
        } label: {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    AsyncImageView(imageType: .poster, imagePath: movie.iPosterPath)
                        .frame(maxWidth: 300)
                    
                    CircularVoteView(votes: movie.iVoteAverage)
                        .padding(5)
                        .frame(width: 60, height: 60)
                }
                
                VStack(alignment: .leading) {
                    Text(movie.iTitle)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    Text(movie.iReleaseDate)
                        .font(.subheadline)
                }
                .foregroundColor(.primary)
                .padding()
                .frame(height: 100, alignment: .topLeading)
            }
            .background(.background)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .secondary, radius: 5)
        }
    }
}

struct MovieGridCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieGridCellView(movie: Movie(adult: false, backdropPath: "/lWqjXgut48IK5f5IRbDBAoO2Epp.jpg", genreIDS: nil, id: 502356, originalTitle: "Some Original Title", overview: nil, popularity: nil, posterPath: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", releaseDate: "1990-08-20", title: "The Super Mario Bros Movie. The Super Mario Bros Movie. The Super Mario Bros Movie.", video: nil, voteAverage: 6.432, voteCount: 1211))
            .frame(maxWidth: 300)
    }
}
