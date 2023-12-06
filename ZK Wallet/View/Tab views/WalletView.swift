//
//  WalletView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct WalletView: View {
    @Binding var selectedTab: Int
    @State private var cards: [CardModel] = [
        CardModel( cardType: "Social Security", cardNumber: "1234 5678 9101 1121", symbolName: "building.columns.fill", gradientColors: [Color.red, Color.orange]),
        CardModel( cardType: "Passport", cardNumber: "2345 6789 0123 4567", symbolName: "building.columns.fill", gradientColors: [Color.green, Color.blue]),
    ]
    @State private var selectedCardIndex: Int? = nil
    @State private var isCardExpanded: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                if cards.isEmpty {
                    NoCardsView()
                } else if let selectedIndex = selectedCardIndex, isCardExpanded {
                    ExpandedCardView(card: cards[selectedIndex], isCardExpanded: $isCardExpanded)
                } else {
                    CardStackView(cards: $cards, selectedCardIndex: $selectedCardIndex, isCardExpanded: $isCardExpanded)
                }
            }
            .padding()
        }
    }
}


#Preview {
    WalletView(selectedTab: .constant(0))
}
