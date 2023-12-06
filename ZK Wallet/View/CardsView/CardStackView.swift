//
//  CardStackView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 12/6/23.
//

import SwiftUI

struct CardStackView: View {
    @Binding var cards: [CardModel]
    @Binding var selectedCardIndex: Int?
    @Binding var isCardExpanded: Bool

    var body: some View {
        ZStack {
            ForEach(cards.indices, id: \.self) { index in
                CardView(
                    cardType: cards[index].cardType,
                    cardNumber: cards[index].cardNumber,
                    companySymbol: Image(systemName: cards[index].symbolName),
                    gradientColors: cards[index].gradientColors
                )
                .offset(x: 0, y: CGFloat(index * 30))
                .onTapGesture {
                    withAnimation {
                        selectedCardIndex = index
                        isCardExpanded = true
                    }
                }
            }
        }
    }
}

#Preview {
    CardStackView(cards: .constant([
        CardModel(cardType: "Social Security", cardNumber: "1234 5678 9101 1121", symbolName: "building.columns.fill", gradientColors: [Color.red, Color.orange]),
        CardModel(cardType: "Passport", cardNumber: "2345 6789 0123 4567", symbolName: "building.columns.fill", gradientColors: [Color.green, Color.blue]),

    ]), selectedCardIndex: .constant(nil), isCardExpanded: .constant(false))
}
