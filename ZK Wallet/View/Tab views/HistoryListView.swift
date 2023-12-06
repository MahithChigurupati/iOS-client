//
//  HistoryListView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct HistoryListView: View {
    // Sample data structure for transaction history
    let transactionHistory = [
        Transaction(companyName: "Company A", date: "23 Nov 2023", amount: "$200.00", companyImage: "building"),
        Transaction(companyName: "Company B", date: "22 Nov 2023", amount: "$150.50", companyImage: "house"),
        Transaction(companyName: "Company C", date: "21 Nov 2023", amount: "$300.75", companyImage: "leaf"),
    ]

    var body: some View {
        NavigationView {
            List(transactionHistory, id: \.self) { transaction in
                NavigationLink(destination: DetailedHistoryView(transaction: transaction)) {
                    HistoryCell(transaction: transaction)
                }
            }
            .navigationTitle("Proof History")
        }
    }
}

#Preview {
    HistoryListView()
}
