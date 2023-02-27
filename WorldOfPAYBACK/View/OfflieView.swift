//
//  OfflieView.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 27/02/2023.
//

import SwiftUI

struct OfflieView: View {
    var body: some View {
        VStack {
            Text("You are offline!")
            Text("Turn on the Wifi or Mobile data")
        }
    }
}

struct OfflieView_Previews: PreviewProvider {
    static var previews: some View {
        OfflieView()
    }
}
