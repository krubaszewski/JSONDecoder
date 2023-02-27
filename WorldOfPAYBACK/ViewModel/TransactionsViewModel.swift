//
//  TransactionsViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 19/02/2023.
//

import Foundation
import Combine

class TransactionsViewModel: ObservableObject {
    
    @Published var transactions: [Item] = []
    @Published var cat: FilterOption = .All
    @Published var randomBool = Bool.random()
    
    private let dataService = TransactionsDataService()
    private var cancel = Set<AnyCancellable>()

    var sumOfDisplayedAmounts: Int {
        transactions.map { $0.transactionDetail.value.amount }.reduce(0, +)
    }

    init(){
        addSubscriber()
    }

    func addSubscriber() {
        dataService.$transactions
            .combineLatest($cat)
            .map(sortAndFilter)
            .sink { [weak self] (fact) in
            self?.transactions = fact
        }.store(in: &cancel)
    }
    
    func sortAndFilter(transactions: [Item], filter: FilterOption) -> [Item] {
        var test = sortByDate(transactions: transactions)
        var new = testFilter(filter: filter, transactions: test)
        return new
    }
    func sortByDate(transactions: [Item]) -> [Item] {
        transactions.sorted(by: {
            $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate
        })
    }

    func testFilter(filter: FilterOption, transactions: [Item]) -> [Item] {
        switch filter {
        case .ONE:
            return transactions.filter { $0.category == 1 }
        case .TWO:
            return transactions.filter { $0.category == 2 }
        case.THREE:
            return transactions.filter { $0.category == 3 }
        case .All:
            return transactions
        }
    }

    //- MARK: Function to call the model to fetch the data from JSON file
    //func fetchFromFile() {
    //    do {
    //        let res = try StaticJSONMapper.decode(file: "PBTransactions", type: Transactions.self)
    //        transactions = res.items
    //        sortByDate()
    //        sumDisplayedAmounts()
    //    } catch {
    //        print(error)
    //    }
    //}

    //- MARK: Function to sum all amounts
    //func sumDisplayedAmounts() {
    //    sumOfDisplayedAmounts = transactions.map{ $0.transactionDetail.value.amount }.reduce(0, +)
    //}
    //
    ////- MARK: Function to sort by date
    //func sortByDate() {
    //    transactions = transactions.sorted(by: {
    //        $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate
    //    })
    //}
    //
    ////- MARK: Function to sort by category
    //func sortByCategory(_ category: String) {
    //    transactions = transactions.filter { $0.category == Int(category) }
    //}
    //
    ////- MARK: Function to filtr by category
    //func filterByCategories(_ categories: String) {
    //    fetchFromFile()
    //    sortByCategory(categories)
    //    sumDisplayedAmounts()
    //}
    //
    ////- MARK: Function to update view based on selected category
    //func updateDataByCategory(categories: String) {
    //
    //    self.categories = categories
    //
    //    if categories == "1" {
    //        filterByCategories(categories)
    //    } else if categories == "2" {
    //        filterByCategories(categories)
    //    } else if categories == "3" {
    //        filterByCategories(categories)
    //    } else {
    //        fetchFromFile()
    //    }
    //}
    //}
}
extension Formatter {
    static let formatter = DateFormatter()
}
