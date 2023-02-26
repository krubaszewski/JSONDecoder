//
//  TransactionPillView.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 23/02/2023.
//

import SwiftUI

struct TransactionPillView: View {

    let transaction: Item

    var body: some View {

        HStack {
            VStack(alignment: .leading, spacing: 2) {
                dateSegment
                transactionDetail
            }
            Spacer()
            amountDetail
        }.frame(maxWidth: 320,
            alignment: .leading)
            .padding(.horizontal, 20)
            .background(Color.blue)
            .cornerRadius(25)
    }
}

struct TransactionPillView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionPillView(transaction: dev.transaction)
            .previewLayout(.sizeThatFits)
    }
}

extension TransactionPillView {

    private var dateSegment: some View {
        Text(transaction.transactionDetail.bookingDate.customDateFormat())
            .fontWeight(.heavy)
            .padding(.top, 5)
    }

    private var transactionDetail: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(transaction.transactionDetail.description ?? "N/A")
                .font(.title3)
                .fontWeight(.medium)

            Text(transaction.partnerDisplayName)
                .font(.callout)
                .padding(.bottom, 10)
                .fontWeight(.medium)
                .italic()
        }
    }

    private var amountDetail: some View {

        Text("\(transaction.transactionDetail.value.amount) \(transaction.transactionDetail.value.currency)")
            .font(.title2)
            .fontWeight(.heavy)
    }

}

