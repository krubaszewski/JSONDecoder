//
//  TransactionsDetailView.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 20/02/2023.
//

import SwiftUI

struct TransactionsDetailView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    general
                }.padding()
            }
        }.navigationTitle("Transaction detail")
    }

    struct TransactionsDetailView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                TransactionsDetailView()
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
            .background(Color.brown,
            in: RoundedRectangle(cornerRadius: 16))
    }

    @ViewBuilder
    var partnerName: some View {
        Text("Partner name")
            .font(
                .system(.title3, design: .rounded)
                .weight(.semibold)
        )

        Text("dm-dogerie markt")
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

        Text("Punkte sammeln")
            .font(.title2)
            .italic()
    }
}
