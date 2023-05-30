//
//  AsyncImageViewModel.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 22/4/23.
//

import Foundation

class AsyncImageViewModel: ObservableObject {
    
    func getMovieImageUrl(imageType aImageType: ImageType, path aPath: String) -> URL? {
        return WebService.sharedInstance.getImageQuery(withImageType: aImageType, andPath: aPath)
    }
}
