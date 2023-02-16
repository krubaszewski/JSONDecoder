//
//  TransactionsView.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 15/02/2023.
//

import SwiftUI

struct TransactionsView: View {
    
    @State private var transactions: [Item] = []

    var body: some View {
        NavigationStack{
            ZStack{
                List{
                    VStack{
                        Text("Sum of displayed transactions:")
                            .font(.title3)
                        VStack(alignment: .center){
                            Text("12000")
                                .font(.title2)
                                .fontWeight(.heavy)
                        }
                    }
                    VStack(alignment: .leading){
                        ForEach(transactions, id: \.id){
                            item in
                            HStack{
                                VStack(alignment: .leading, spacing: 2){
                                    //- TODO: Zmienić formatowanie daty, lepsze formatowanie
                                    Text(convertDateFormater("\(item.transactionDetail.bookingDate.formatted(.iso8601))"))
                                        .fontWeight(.heavy)
                                        .padding(.top,5)
                                    //- TODO: dodać codingkey dla description
                                    Text("\(item.transactionDetail.descript ?? "N/A")")
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
                            } .frame(maxWidth: 320,
                                     alignment: .leading)
                                                     .padding(.horizontal, 20)
                                                     .background(Color.blue)
                                                     .cornerRadius(25)
                                                     .padding(.bottom, 0.3)
                        }
                       
                    }
                }.navigationTitle("Transactions")
                    .onAppear(){
                        do{
                            let res = try StaticJSONMapper.decode(file: "PBTransactions", type: Transactions.self)
                            transactions = res.items
                        } catch{
                            print(error)
                        }
                    }
            }
        }

    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
    }
}
