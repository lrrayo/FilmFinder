//
//  NoInternetConnectionView.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 28/4/23.
//

import SwiftUI

struct NoInternetConnectionView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    var body: some View {
        VStack {
            Image(systemName: networkMonitor.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.secondary)
            
            Text(networkMonitor.connectionDescription)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct NoInternetConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        NoInternetConnectionView()
    }
}
