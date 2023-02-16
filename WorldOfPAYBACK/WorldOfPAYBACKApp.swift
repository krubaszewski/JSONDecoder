//
//  WorldOfPAYBACKApp.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 15/02/2023.
//

import SwiftUI

@main
struct WorldOfPAYBACKApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            TabView{
                TransactionsView()
                    .tabItem{
                        Symbols.transactions
                        Text("Transactions")
                    }
            }
            
        }
    }
}
