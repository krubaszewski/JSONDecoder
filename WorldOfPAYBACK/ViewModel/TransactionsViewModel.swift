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
        
        init(){
            fileFetch()
            sumAmount()
        }
        @Published var transactions: [Item] = []
        @Published var dupa: [Item] = []
//        @Published var test: [Item] = []
        @Published var sumOfDisplayedAmounts: Int = 0
        @Published var categories = "All"
        
        //- MARK: Function to call the model to fetch the data from JSON file
        func fileFetch(){
            do{
                let res = try StaticJSONMapper.decode(file: "PBTransactions", type: Transactions.self)
                transactions = res.items.sorted(by: {
                    $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate
                })
                sumAmount()
            }catch{
                print(error)
            }
        }
        
        //- MARK: Function to sum all amounts
        func sumAmount(){
            sumOfDisplayedAmounts = transactions.map{ $0.transactionDetail.value.amount }.reduce(0,+)
        }
        
        func test(_ categories: String){
            fileFetch()
            transactions = transactions.sorted(by: {
                $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate
            }).filter{ $0.category == Int(categories) }
            sumAmount()
        }

        func updateData(categories: String){
            
            self.categories = categories
            if categories == "1"{
                test(categories)
            }else if categories == "2"{
                test(categories)
            } else if categories == "3"{
                test(categories)
            }else{
                fileFetch()
            }
            
        }
        
        //- MARK: Unused method for filtering, there are two ways of achieving sorted data
        //        func sortDate(){
        //            test = transactions.sorted(by: {
        //                $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate
        //                })//sorting- take an array and sort items by date: ascending or descending depending on the operator.
        //
        //        //- MARK: Using functions declared in struct Data model
        //            test = transactions.sorted(by: >)//filer using propper operator
        //        test = transactions.sorted(by: <)//differnet operator
        //        }
    }
}
