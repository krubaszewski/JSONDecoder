//
//  LunchScreen.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 25/02/2023.
//

import SwiftUI

struct LunchScreen: View {
    
    @EnvironmentObject var lunchScreenManager: LunchScreenManager
//    @ObservedObject var test2 = LunchScreenManager()
    @State var infoooo: String = "Loading data..."
    @State var isActive: Bool = true
    
    
    var body: some View {
        ZStack {
            bacgroundcolor
            
            VStack {
                VStack {
                    Text("World of PAYBACK")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(infoooo)
                        .font(.headline)
                        .fontWeight(.medium)
                    
                }
                VStack {
                    if isActive {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    }
                }
            }
        }
        .alert("There was a problem!", isPresented: $lunchScreenManager.hasError){
            Button(action: {
                isActive = false
                infoooo = "There was a problem! Close the app and try again"
            }) {
                Text("OK")
            }
        }.onAppear { DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { lunchScreenManager.dismiss() } }
    }
    
    struct LunchScreen_Previews: PreviewProvider {
        static var previews: some View {
            LunchScreen()
                .environmentObject(LunchScreenManager())
        }
    }
}
    
private extension LunchScreen {
        var bacgroundcolor: some View {
            Color.white.ignoresSafeArea(.all)
        }
    }

