//
//  TransactionsViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 19/02/2023.
//

import Foundation

extension TransactionsView{
    
    @MainActor
    class ViewModel: ObservableObject{
       @Published var transactions: [Item] = []
        @Published var sumOfDisplayedAmounts: Int = 0
        
        func testFetch(){
            do{
                let res = try StaticJSONMapper.decode(file: "PBTransactions", type: Transactions.self)
                
                transactions = res.items.sorted(by: {
                    $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate})
            }catch{
                print(error)
            }
        }
        
        func sumAmount(){
            sumOfDisplayedAmounts = transactions.map{ $0.transactionDetail.value.amount }.reduce(0,+)
        }
//    init(){
//        sumAmount()
//    }
//
//        func sortDate(){
//
//            tr = tr.sorted(by: {
//                $0.partnerDisplayName < $1.partnerDisplayName
//            })
//
////            tr = tr.sorted(by: {$0.transactionDetail.bookingDate < $1.transactionDetail.bookingDate})
//
////            test = tr.sorted(by: <)
//        }
    }
}
