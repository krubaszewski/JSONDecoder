//
//  TransactionsDetailView.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 20/02/2023.
//

import SwiftUI


struct DetailsViewLoading: View {
    
    @Binding var transaction: Item?

    var body: some View {

        if let transaction = transaction {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        TransactionsDetailView(transaction: transaction)
                    }.padding()
                }
            }.navigationBarTitle("Transaction Detail", displayMode: .inline)
        }
    }
}


struct TransactionsDetailView: View {
    
    let transaction: Item

    init(transaction: Item) {
        self.transaction = transaction
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    general
                }.padding()
            }
        }.navigationBarTitle("Transaction Detail", displayMode: .inline)
    }

    struct TransactionsDetailView_Previews: PreviewProvider {

        @EnvironmentObject var vm: TransactionsViewModel

        static var previews: some View {
            NavigationView {
                TransactionsDetailView(transaction: dev.transaction)
                    .environmentObject(TransactionsViewModel())
            }
        }
    }
}

private extension TransactionsDetailView {

    @ViewBuilder
    var general: some View {

        VStack(alignment: .leading, spacing: 10) {

            partnerName
            transactionDescription

        }.padding(.horizontal, 8)
            .padding(.vertical, 18)
            .background(Color.blue,
            in: RoundedRectangle(cornerRadius: 16))
    }

    @ViewBuilder
    var partnerName: some View {

            Text("Partner name")
                .font(
                    .system(.title3, design: .rounded)
                    .weight(.semibold))

        Text(transaction.partnerDisplayName)
                .font(.title2)
                .italic()
            Divider()
    }

    @ViewBuilder
    var transactionDescription: some View {

        Text("Transactions description")
            .font(
                .system(.title3, design: .rounded)
                .weight(.semibold)
        )

        Text(transaction.transactionDetail.description ?? "N/A")
            .font(.title2)
            .italic()
    }
}
