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

    var body: some Scene {
        WindowGroup {
            TabView {
                TransactionsView()
                    .tabItem {
                    Symbols.transactions
                    Text("Transactions")
                }
            }.environmentObject(vm)
        }
    }
}
