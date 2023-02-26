//
//  Test.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 24/02/2023.
//

import SwiftUI

struct Test: View {
    
    var randomDouble = Double.random(in: 1..<3)
    @State var randomBool: Bool
    
    var body: some View {
        ZStack {
//            VStack {

                
                //                ProgressView()
                //                    .progressViewStyle(CircularProgressViewStyle(tint: .blue)
                //                ) }.onAppear { if randomBool {
                //                fakeURLCall() }
                //            }
//            }.onAppear { print(randomBool)}
        }
        
        
        //    func fakeURLCall() {
        //
        //        DispatchQueue.main.asyncAfter(deadline: .now() + randomDouble) {
        //            print("test")
        //        }
        //    }
    }
    
    struct Test_Previews: PreviewProvider {
        static var previews: some View {
            Test(randomBool: Bool.random())
        }
    }
    
}
