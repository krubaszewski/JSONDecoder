//
//  TransactionsView.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 15/02/2023.
//

import SwiftUI


struct TransactionsView: View {


    @StateObject private var vm = ViewModel()

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
                        ForEach(vm.transactions, id: \.id) { item in
                            HStack {
                                VStack(alignment: .leading, spacing: 2) {

                                    Text(item.transactionDetail.formattedDate)
                                        .fontWeight(.heavy)
                                        .padding(.top, 5)

                                    Text(item.transactionDetail.description ?? "N/A")
                                        .font(.title3)
                                        .fontWeight(.medium)

                                    Text("\(item.partnerDisplayName)")
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
                    .toolbar(content: {
                    Menu(content: {
                        ForEach(categories, id: \.self) { cat in
                            Button(action: { vm.updateDataByCategory(categories: cat) }, label: {
                                    Text(cat)
                                })
                        }
                    })
                    {
                        Text("Category: \(vm.categories)")
                    }
                })
//                    .onAppear(){
//                        vm
//                    }
            }
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
    }
}
