//
//  TransactionsView.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 15/02/2023.
//

import SwiftUI


struct TransactionsView: View {

    @EnvironmentObject private var vm: TransactionsViewModel
    @EnvironmentObject var lunchScreenManager: LunchScreenManager
    @EnvironmentObject var networkMenager: NetworkMenager

    @State private var selectedTransaction: Item? = nil
    @State private var showDetailView: Bool = false
    @StateObject private var errorHandel = TransactionsDataService()

    var body: some View {
        ZStack {

            allTransactions
        }.navigationTitle("Transactions")
            .listStyle(PlainListStyle())
            .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Sum: \(vm.sumOfDisplayedAmounts)")
                    .fontWeight(.semibold)
            }
        }.toolbar(content: {
            toolBarCategoryFilter
        })
            .background(
            NavigationLink(
                destination: DetailsViewLoading(transaction: $selectedTransaction),
                isActive: $showDetailView,
                label: { EmptyView() })
        ).alert(isPresented: $errorHandel.hasError, error: errorHandel.error) { }
    }
    func test(teste: FilterOption) {
        switch teste {
        case .ONE:
            vm.cat = .ONE
        case .TWO:
            vm.cat = .TWO
        case .THREE:
            vm.cat = .THREE
        default:
            vm.cat = .All
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {

        NavigationView {
            TransactionsView()
        }.environmentObject(TransactionsViewModel())
            .environmentObject(LunchScreenManager())
            .environmentObject(NetworkMenager())
            .listRowSeparator(.hidden)
    }
}

extension TransactionsView {

    private var allTransactions: some View {
        List() {
            if errorHandel.isLoading == true {
                LunchScreen()
            } else {
                ZStack {
                    summaryDisplay
                }
                ForEach(vm.transactions) { item in
                    TransactionPillView(transaction: item)
                        .onTapGesture {
                        goToDetail(transaction: item)
                    }.listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0,
                        leading: 30,
                        bottom: 8,
                        trailing: -10))
                    //                NavigationLink(destination: TransactionsDetailView(transaction: item),
                    //                    label: {
                    //                    })
                    //                    .listRowSeparator(.hidden)
                    //                .listRowInsets(EdgeInsets(top: 0,
                    //                                leading: 16,
                    //                                bottom: 8,
                    //                                trailing:0))
                }
            }
        }
    }

    private func goToDetail(transaction: Item) {
        selectedTransaction = transaction
        showDetailView.toggle()
    }

    private var toolBarCategoryFilter: some View {
        VStack {
            Menu(content: {
                ForEach(FilterOption.allFilters, id: \.self) { filter in
                    Button(action: { test(teste: filter) }, label: {
                            Text("\(filter.rawValue)")
                        })
                }
            })
            {
                Text("Category: \(vm.cat.rawValue)")
            }
        }
    }

    private var summaryDisplay: some View {
        VStack {
            Text("Sum of displayed transactions:")
                .font(.title3)

            Text("\(vm.sumOfDisplayedAmounts)")
                .font(.title2)
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .center)
            Divider()
        }
    }
}
