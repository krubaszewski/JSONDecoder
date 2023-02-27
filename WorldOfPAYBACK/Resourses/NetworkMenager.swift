//
//  NetworkMenager.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 27/02/2023.
//

import Foundation
import Network


enum NetworkScreenPhase {
    case online
    case offline
}

class NetworkMenager: ObservableObject {
    @Published private(set) var state: NetworkScreenPhase = .online
    @Published var isConnected = true
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")

    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    self.isConnected = true
                    self.state = .online
                } else {
                    self.isConnected = false
                    self.state = .offline
                }
            }
        }
        monitor.start(queue: queue)
    }
}
