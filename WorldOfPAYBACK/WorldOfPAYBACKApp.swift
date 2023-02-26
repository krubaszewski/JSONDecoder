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

    @State var randomBool = Bool.random()

    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    TransactionsView()
                    //                    .tabItem {
                    //                    Symbols.transactions
                    //                    Text("Transactions")
                    //                }
                }.environmentObject(vm)
                
                if lunchScreenManager.state != .completed{
                    LunchScreen()
                }
            }.environmentObject(lunchScreenManager)
        }
    }
}

