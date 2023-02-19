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
    
struct Item: Decodable, Identifiable{
//    var id: UUID? = UUID()
    var id = UUID()
    let partnerDisplayName: String
    let alias: Alias
    let category : Int
    let transactionDetail: TransactionDetail
    
    enum CodingKeys: String, CodingKey{
        case partnerDisplayName, alias, category, transactionDetail
    }
    
//    static func >(lhs: Item, rhs: Item) -> Bool{
//        lhs.transactionDetail.formattedDate > rhs.transactionDetail.formattedDate
//    }
    //    static func == (lhs: Item, rhs: Item) -> Bool {
    //        lhs.transactionDetail.value.amount == rhs.transactionDetail.value.amount
    //    }
    //
    //    static func > (lhs: Item, rhs: Item) -> Bool {
    //        lhs.transactionDetail.value.amount > rhs.transactionDetail.value.amount
    //    }
    //
//        static func < (lhs: Item, rhs: Item) -> Bool {
//            lhs.partnerDisplayName < rhs.partnerDisplayName
//        }
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
    
//    static func > (lhs: Value, rhs: Value) -> Bool {
//        lhs.amount > rhs.amount
//    }
    
    //    static func < (lhs: Value, rhs: Value) -> Bool {
    //        lhs.amount < rhs.amount
    //
    //    }
}
