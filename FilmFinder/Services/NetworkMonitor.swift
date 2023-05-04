//
//  NetworkMonitor.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 28/4/23.
//

import Foundation
import Network
import SwiftUI

class NetworkMonitor: ObservableObject {
    @Published var isConnected = true
    
    let networkMonitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    
    var imageName: String {
        return isConnected ? "wifi" : "wifi.slash"
    }
    
    var connectionDescription: LocalizedStringKey {
        if isConnected {
            return ""
        } else {
            return "NetworkManagerNoInternet"
        }
    }
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            Task {
                await MainActor.run {
                    self.isConnected = path.status == .satisfied
                    self.objectWillChange.send()
                }
            }
        }
        
        networkMonitor.start(queue: queue)
    }
}
