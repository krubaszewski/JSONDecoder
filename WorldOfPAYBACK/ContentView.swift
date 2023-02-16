//
//  ContentView.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 15/02/2023.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        Text("elo")
            .onAppear{
                print("test")
                dump(
                     try? StaticJSONMapper.decode(file: "PBTransactions", type: Transactions.self)
                )
            }
  
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
