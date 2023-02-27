//
//  WorldOfPAYBACKApp.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 15/02/2023.
//

import SwiftUI

@main
struct WorldOfPAYBACKApp: App {

    @StateObject private var vm = TransactionsViewModel()
    @StateObject var lunchScreenManager = LunchScreenManager()
    @StateObject private var networkMenager = NetworkMenager()

    var body: some Scene {
        WindowGroup {
            if networkMenager.state == .offline {
                OfflieView()
            } else {
                ZStack {
                    TabView {
                        NavigationView {
                            TransactionsView()
                        }.tabItem {
                            Symbols.transactions
                            Text("Transactions")
                        }
                        NavigationView {
                            OnlineShoppingView()
                            }.tabItem {
                                Symbols.shopping
                                Text("Online Shopping")
                        }
                    }.environmentObject(vm)
                        .environmentObject(NetworkMenager())

                    if lunchScreenManager.state != .completed && networkMenager.state == .online {
                        LunchScreen()
                    }
                }.environmentObject(lunchScreenManager)
                    .environmentObject(NetworkMenager())
            }
        }
    }
}

