//
//  AsyncImageView.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 22/4/23.
//

import SwiftUI

struct AsyncImageView: View {
    var imageType: ImageType
    var imagePath: String
    
    var noImageName: String {
        switch imageType {
        case .original:
            return "no-image"
        case .poster:
            return "no-image"
        case .backdrop:
            return "no-image-backdrop"
        case .profile:
            return "no-image"
        }
    }
    
    @StateObject var viewModel = AsyncImageViewModel()
    
    var body: some View {
        if imagePath == "" {
            Image(noImageName)
                .resizable()
                .scaledToFit()
        } else {
            AsyncImage(url: viewModel.getMovieImageUrl(imageType: imageType, path: imagePath)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    AsyncImage(url: viewModel.getMovieImageUrl(imageType: imageType, path: imagePath)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Image(noImageName)
                                .resizable()
                                .scaledToFit()
                        } else {
                            ProgressView()
                                .padding()
                        }
                    }
                } else {
                    ProgressView()
                        .padding()
                }
            }
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(imageType: .poster, imagePath: "/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg")
    }
}
