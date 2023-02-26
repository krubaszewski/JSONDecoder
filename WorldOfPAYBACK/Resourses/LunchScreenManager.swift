//
//  LunchScreenManager.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 25/02/2023.
//

import Foundation
import SwiftUI

enum LunchScreenPhase {
    case begin
    case completed
}

final class LunchScreenManager: ObservableObject {

    @Published private(set) var state: LunchScreenPhase = .begin
    @Published var hasError = false
    private var fileError = TransactionsDataService()

    func dismiss() {
        var randomDouble = Double.random(in: 1...3)
        hasError = Bool.random()
        
        print("Stan haserror z dissmissa: \(self.hasError)")
        print("Stan haserrorTest z dissmissa: \(self.fileError.hasError)")

        if self.hasError == false && self.fileError.hasError == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + randomDouble) {
                print("Stan z ifa: \(self.hasError)")
                self.goToContentView()
            }
        } else if self.hasError == true {
            print("Stan z elsa: \(self.hasError)")
            self.state = .begin
        }
    }

    func goToContentView() {
        self.state = .completed
    }
}
