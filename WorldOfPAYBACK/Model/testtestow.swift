//
//  testtestow.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 15/02/2023.
//

import Foundation

struct Transactions: Decodable{
    let items: [Item]
}
    
struct Item: Decodable, Identifiable, Comparable{

    //    var id: UUID? = UUID()
    var id = UUID()
    let partnerDisplayName: String
    let alias: Alias
    let category : Int
    let transactionDetail: TransactionDetail
    
    enum CodingKeys: String, CodingKey{
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
    
struct Alias: Decodable{
    let reference: String
    }
    
struct TransactionDetail: Decodable{
    
    let descript: String?
    let bookingDate: Date
    let value: Value
    

    enum CodingKeys: String, CodingKey{
        case descript = "description"
        case bookingDate
        case value
    }
    
    var formattedDate: String{
        
        //bookingDate.formatted(date: .abbreviated, time: .omitted)

        let cos = DateFormatter()
        cos.locale = Locale(identifier: "de_DE")
        cos.dateStyle = .medium
        let timeStamp = cos.string(from: bookingDate)
        return timeStamp
    }
    
    static func <(lhs: TransactionDetail, rhs: TransactionDetail) -> Bool{
        lhs.value.amount < rhs.value.amount
    }
    
}
    
struct Value: Decodable{
    let amount: Int
    let currency: String
}

var categories = ["All", "1", "2", "3"]
