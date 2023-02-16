////
////  DataModel.swift
////  WorldOfPAYBACK
////
////  Created by Kacper Rubaszewski on 15/02/2023.
////
//
//import Foundation
//
////struct Items: Decodable, Identifiable{
////
////    var id = UUID()
////    let partnerDisplayName: String
//////    let alias: Alias
////    let category: Int
////
////}
//
////struct Alias: Codable {
////    var reference: String
////}
//
////struct Astro: Codable, Identifiable{
////    let id: String
////    let name: String
////    let description: String
////}
//
//
//struct TransactionsResponse: Decodable{
//    var items: [Transactions] = [Transactions]()
//
//    
//    private enum TransationsList: String, CodingKey{
//        case items
//    }
//    
//    
//    init(from decoder: Decoder) throws{
//        if let transResponse = try? decoder.container(keyedBy:TransationsList.self){
//            
//            self.items = try transResponse.decode([Transactions].self, forKey: TransationsList.items)
//        }
//    }
//}
//    
//    struct Transactions: Decodable{
//        //    var id = UUID()
//        let partnerDisplayName: String
//        //    let alias: Alias
//        let category: Int
//        //    let transactionDetail: TransactionDetail
//    }
//    
//    //struct Alias: Decodable{
//    //    let reference: String
//    //}
//    //struct TransactionDetail: Decodable{
//    //    let description: String
//    //    let bookingDate: Date
//    //    let value: Value
//    //}
//    //
//    //struct Value: Decodable{
//    //    let amount: Int
//    //    let currency: String
//    //}
//
