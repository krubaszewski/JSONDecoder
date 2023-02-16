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
}
    
struct Value: Decodable{
    let amount: Int
    let currency: String
}

//struct ServerResponse: Decodable, Identifiable {
//
//    var id = UUID()
//    let partnerName: String
//    let description: String
////    let bookingDate: Date
//    let value: Int
//    let currency: String
//
//    init(from decoder: Decoder) throws{
//        let rawResponse = try RawServerResponse(from: decoder)
//
//        partnerName = rawResponse.items.
//
//    }
//
//
//
//}
