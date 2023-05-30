//
//  WelcomeView.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 27/4/23.
//

import SwiftUI

///View for large devices
struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("WelcomeTitle")
                .font(.largeTitle)
            Text("WelcomeInformation")
                .foregroundColor(.secondary)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
