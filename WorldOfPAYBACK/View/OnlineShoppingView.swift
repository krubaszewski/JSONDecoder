//
//  OnlineShoppingView.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 27/02/2023.
//

import SwiftUI

struct OnlineShoppingView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Work in progress...")
                    .font(.title)
            }.navigationBarTitle("Online Shopping", displayMode: .inline)
        }
    }
}

struct OnlineShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OnlineShoppingView()
        }
    }
}
