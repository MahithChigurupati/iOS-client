//
//  HistoryCell.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct HistoryCell: View {
    var transaction: Transaction

    var body: some View {
        HStack {
            Image(systemName: transaction.companyImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding(.trailing, 10)

            VStack(alignment: .leading) {
                Text(transaction.companyName)
                    .font(.headline)
                Text(transaction.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Text(transaction.amount)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding()
    }
}

#Preview {
    HistoryCell(
        transaction: Transaction(companyName: "Company A", date: "23 Nov 2023", amount: "$200.00", companyImage: "building")
    )
}
