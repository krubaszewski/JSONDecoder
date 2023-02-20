//
//  testtestow.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 15/02/2023.
//

import Foundation

struct Transactions: Decodable {
    let items: [Item]
}

struct Item: Decodable, Identifiable, Comparable {

    //    var id: UUID? = UUID()
    var id = UUID()
    let partnerDisplayName: String
    let alias: Alias
    let category: Int
    let transactionDetail: TransactionDetail

    enum CodingKeys: String, CodingKey {
        case partnerDisplayName, alias, category, transactionDetail
    }

    //- MARK: Used for filtering, one way of achieving sorted data (func is in the file TransactionsView)
    static func > (lhs: Item, rhs: Item) -> Bool {
        lhs.transactionDetail.bookingDate > rhs.transactionDetail.bookingDate
    }

    static func < (lhs: Item, rhs: Item) -> Bool {
        lhs.transactionDetail.bookingDate < rhs.transactionDetail.bookingDate
    }

    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.transactionDetail.bookingDate == rhs.transactionDetail.bookingDate
    }
}

var categories = ["All", "1", "2", "3"]

struct Alias: Decodable {
    let reference: String
}

struct TransactionDetail: Decodable {

    let description: String?
    let bookingDate: Date
    let value: Value

    var formattedDate: String {
        //bookingDate.formatted(date: .abbreviated, time: .omitted)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        formatter.dateStyle = .medium
        let dateNewFormat = formatter.string(from: bookingDate)
        return dateNewFormat
    }
}

struct Value: Decodable {
    let amount: Int
    let currency: String
}

