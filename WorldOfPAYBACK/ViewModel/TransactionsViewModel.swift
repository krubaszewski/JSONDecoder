//
//  TransactionsViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 19/02/2023.
//

import Foundation

extension TransactionsView {

    @MainActor
    class ViewModel: ObservableObject {
        @Published var transactions: [Item] = []
        @Published var sumOfDisplayedAmounts: Int = 0
        @Published var categories = "All"

        init() {
            fetchFromFile()
            sortByDate()
            sumDisplayedAmounts()
        }

        //- MARK: Function to call the model to fetch the data from JSON file
        func fetchFromFile() {
            do {
                let res = try StaticJSONMapper.decode(file: "PBTransactions", type: Transactions.self)
                transactions = res.items
                sortByDate()
                sumDisplayedAmounts()
            } catch {
                print(error)
            }
        }

        //- MARK: Function to sum all amounts
        func sumDisplayedAmounts() {
            sumOfDisplayedAmounts = transactions.map { $0.transactionDetail.value.amount }.reduce(0, +)
        }

        //- MARK: Function to sort by date
        func sortByDate() {
            transactions = transactions.sorted(by: {
                $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate
            })
        }

        //- MARK: Function to sort by category
        func sortByCategory(_ category: String) {
            transactions = transactions.filter { $0.category == Int(category) }
        }

        //- MARK: Function to filtr by category
        func filterByCategories(_ categories: String) {
            fetchFromFile()
            sortByCategory(categories)
            sumDisplayedAmounts()
        }

        //- MARK: Function to update view based on selected category
        func updateDataByCategory(categories: String) {

            self.categories = categories

            if categories == "1" {
                filterByCategories(categories)
            } else if categories == "2" {
                filterByCategories(categories)
            } else if categories == "3" {
                filterByCategories(categories)
            } else {
                fetchFromFile()
            }
        }
    }
}

extension Formatter {
    static let formatter = DateFormatter()
}
