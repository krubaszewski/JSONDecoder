//
//  TransactionsDataService.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 21/02/2023.
//

import Foundation
import Combine

class TransactionsDataService {
    
    @Published var transactions: [Item] = []
    
    var res: AnyCancellable?
    
    init() {
        fetchFromFile()
    }
    
        func fetchFromFile() {
            do {
                let res = try StaticJSONMapper.decode(file: "PBTransactions", type: Transactions.self)
                
                transactions = res.items
            } catch {
                print(error)
            }
        }
    
}
    

