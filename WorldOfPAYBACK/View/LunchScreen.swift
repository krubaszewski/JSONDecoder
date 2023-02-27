//
//  LunchScreen.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 25/02/2023.
//

import SwiftUI

struct LunchScreen: View {

    @EnvironmentObject var lunchScreenManager: LunchScreenManager
    @EnvironmentObject var networkMenager: NetworkMenager
    @Environment(\.colorScheme) var colorScheme
    @State var infoooo: String = "Loading data..."
    @State var isActive: Bool = true

    var body: some View {

        if networkMenager.state == .offline {
            OfflieView()
        } else {

            ZStack {
                bacgroundcolor

                VStack {
                    VStack {
                        Text("World of PAYBACK")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)

                        Text(infoooo)
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                    }
                    VStack {
                        if isActive {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                                .scaleEffect(2)
                        }
                    }
                }
            }
                .alert("There was a problem!", isPresented: $lunchScreenManager.hasError) {
                Button(action: {
                    isActive = false
                    infoooo = "There was a problem! Close the app and try again"
                }) {
                    Text("OK")
                }
            }.onAppear { if networkMenager.state == .online { DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { lunchScreenManager.dismiss() } } }
        }
    }

    struct LunchScreen_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                LunchScreen().preferredColorScheme(.light)
                LunchScreen().preferredColorScheme(.dark)
            }.environmentObject(LunchScreenManager())
                .environmentObject(NetworkMenager())
        }
    }
}

private extension LunchScreen {
    var bacgroundcolor: some View {
        Color.white.ignoresSafeArea(.all, edges: .bottom)
    }
}
