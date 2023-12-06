//
//  ExpandedCardView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 12/6/23.
//

import SwiftUI

struct ExpandedCardView: View {
    var card: CardModel
    @Binding var isCardExpanded: Bool

    var body: some View {
        VStack {
            CardView(
                cardType: card.cardType,
                cardNumber: card.cardNumber,
                companySymbol: Image(systemName: card.symbolName),
                gradientColors: card.gradientColors
            )
            .onTapGesture {
                withAnimation {
                    isCardExpanded = false
                }
            }

            List {
                Text("Transaction 1")
                Text("Transaction 2")
            }
        }
    }
}

#Preview {
    ExpandedCardView(card: CardModel(cardType: "Social Security", cardNumber: "1234 5678 9101 1121", symbolName: "building.columns.fill", gradientColors: [Color.red, Color.orange]), isCardExpanded: .constant(false))
}
