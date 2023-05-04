//
//  AsyncImageViewModel.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 22/4/23.
//

import Foundation

class AsyncImageViewModel: ObservableObject {
    private let service = WebService()
    
    func getMovieImageUrl(imageType aImageType: ImageType, path aPath: String) -> URL? {
        return service.getImageQuery(withImageType: aImageType, andPath: aPath)
    }
}
