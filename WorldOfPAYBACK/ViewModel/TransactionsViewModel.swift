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
//        @Published var transSorted: [Item] = []
        
        
        init(){
            sortDate()
        }
        func sortDate(){
            transactions = transactions.sorted(by:  {$0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate })
            
//            print(transSorted)
            //        var transSorted  = transactions.values.sorted()
        }
    }
}
