//
//  DetailedHistoryView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct DetailedHistoryView: View {
    var transaction: Transaction

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Spacer()
            
            Text("Company: \(transaction.companyName)")
            Text("Date: \(transaction.date)")
            Text("Amount: \(transaction.amount)")
            
            Spacer()
            Spacer()
        }
        .padding()
        .navigationTitle("History Details")
    }
}

#Preview {
    DetailedHistoryView(
        transaction: Transaction(companyName: "Company A", date: "23 Nov 2023", amount: "$200.00", companyImage: "building")
    )
}
