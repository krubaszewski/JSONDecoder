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
       @Published var tr: [Item] = []
        @Published var test: [Item] = []
        
    init(){
        sortDate()
    }
        
        func sortDate(){
                
//            test = tr.sorted(by: {
//                $0.partnerDisplayName < $1.partnerDisplayName
//            })

            test = tr.sorted(by: {$0.transactionDetail.bookingDate < $1.transactionDetail.bookingDate})
            
//            test = tr.sorted(by: <)
        }
    }
}
