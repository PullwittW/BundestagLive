//
//  NetworkManager.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 18.09.24.
//

import Foundation
import Network

@MainActor
class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    @Published var isConnected = true
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        
        monitor.start(queue: queue)
    }
    
    func checkNetwork() {
        let path = monitor.currentPath
        self.isConnected = path.status == .satisfied
        
        print(self.isConnected)
    }
}
