//
//  PrevievProvider.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 23/02/2023.
//

import Foundation
import SwiftUI


extension PreviewProvider {

    static var dev: DummyData {
        return DummyData.instance
    }
}

class DummyData {

    static let instance = DummyData()
    private init() { }

    let transaction = Item(
        partnerDisplayName: "Tchibo",
        alias: Alias(reference: "623838250608671"),
        category: 1,
        transactionDetail: TransactionDetail(
            description: "Punkte sammeln",
            bookingDate: DateFormatter().date(from: "2022-10-24T10:59:05+0200") ??  Date(),
            value: Value(
                amount: 12,
                currency: "PBP")))
}
