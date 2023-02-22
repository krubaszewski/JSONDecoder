//
//  TransactionsView.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 15/02/2023.
//

import SwiftUI


struct TransactionsView: View {

    @EnvironmentObject private var vm: TransactionsViewModel
    @State var selected = FilterOption.All

    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    VStack {
                        Text("Sum of displayed transactions:")
                            .font(.title3)
                        VStack(alignment: .center) {
                            Text("\(vm.sumOfDisplayedAmounts)")
                                .font(.title2)
                                .fontWeight(.heavy)
                        }
                    }
                    VStack(alignment: .leading) {
                        ForEach(vm.transactions) { item in
                            HStack {
                                VStack(alignment: .leading, spacing: 2) {

                                    //                                    Text(MyDateFormatt().dateFormat(item.transactionDetail.bookingDate))
                                    Text(item.transactionDetail.bookingDate.customDateFormat())
                                        .fontWeight(.heavy)
                                        .padding(.top, 5)

                                    Text(item.transactionDetail.description ?? "N/A")
                                        .font(.title3)
                                        .fontWeight(.medium)

                                    Text(item.partnerDisplayName)
                                        .font(.callout)
                                        .padding(.bottom, 10)
                                        .fontWeight(.medium)
                                        .italic()
                                }

                                Spacer()

                                Text("\(item.transactionDetail.value.amount) \(item.transactionDetail.value.currency)")
                                    .font(.title2)
                                    .fontWeight(.heavy)

                            }.frame(maxWidth: 320,
                                alignment: .leading)
                                .padding(.horizontal, 20)
                                .background(Color.blue)
                                .cornerRadius(25)
                                .padding(.bottom, 0.3)
                        }

                    }
                }.navigationTitle("Transactions")
                //                    .toolbar {
                //                    ToolbarItem() {
                //                        Picker("", selection: $selected.animation())
                //                        {
                //                            ForEach(FilterOption.allFilters, id: \.self) { filter in
                //                                Text("Category: \(filter.rawValue)")
                //                            }
                //                        }
                //                    }
                //                }.onTapGesture {
                //                    test()
                //                    print("tap")
                //                }
                .toolbar(content: {
                    Menu(content: {
                        ForEach(FilterOption.allFilters, id: \.self) { filter in
                            Button(action: { test(filter) }, label: {
                                    Text("\(filter.rawValue)")
                                })
                        }
                    })
                    {
                        Text("Category: \(vm.cat.rawValue)")
                    }
                })
            }
        }
    }

    func test(_ test: FilterOption) {
        if test == FilterOption.All {
            vm.cat = .All
        } else if test == FilterOption.TWO {
            vm.cat = .TWO
        } else if test == FilterOption.THREE {
            vm.cat = .THREE
        } else if test == FilterOption.ONE {
            vm.cat = .ONE
        }
    }
}
struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {

        TransactionsView()
            .environmentObject(TransactionsViewModel())
    }
}
