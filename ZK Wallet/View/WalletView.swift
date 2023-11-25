//
//  WalletView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct WalletView: View {
    @Binding var selectedTab: Int
    @State private var cards = [
        Card(companyName: "Bank A", cardType: "Social Security", cardNumber: "1234 5678 9101 1121", symbolName: "building.columns.fill", gradientColors: [Color.red, Color.orange]),
        Card(companyName: "Bank B", cardType: "Passport", cardNumber: "2345 6789 0123 4567", symbolName: "building.columns.fill", gradientColors: [Color.green, Color.blue]),
        Card(companyName: "Bank C", cardType: "State ID", cardNumber: "3456 7890 1234 5678", symbolName: "building.columns.fill", gradientColors: [Color.purple, Color.pink]),
        Card(companyName: "Bank D", cardType: "Drivers License", cardNumber: "4567 8901 2345 6789", symbolName: "building.columns.fill", gradientColors: [Color.yellow, Color.gray])
    ]
    @State private var selectedCardIndex: Int? = nil
    @State private var isCardExpanded: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                if cards.isEmpty {
                    noCardsView
                } else if let selectedIndex = selectedCardIndex, isCardExpanded {
                    expandedCardView(card: cards[selectedIndex])
                } else {
                    cardStack
                }
            }
            .padding()
        }
    }

    var noCardsView: some View {
            VStack { // Ensure to return a VStack or any other SwiftUI view
                Text("No Cards Added")
                    .font(.headline)
                    .padding(.bottom, 20)
                addButton
            }
        }

    var addButton: some View {
        Button(action: {
            selectedTab = 1 // Change to the second tab (AddCardView)
        }) {
            HStack {
                Image(systemName: "plus.app")
                    .imageScale(.large)
                Text("Add Cards")
                    .fontWeight(.medium)
            }
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .shadow(radius: 10)
        }
    }

    var cardStack: some View {
        ZStack {
            ForEach(cards.indices, id: \.self) { index in
                CardView(
                    companyName: cards[index].companyName,
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

    func expandedCardView(card: Card) -> some View {
        VStack {
            CardView(
                companyName: card.companyName,
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

            // Placeholder for list of transactions
            List {
                Text("Transaction 1")
                Text("Transaction 2")
                // Add more transactions or replace with actual data
            }
        }
    }
}

// Example Card struct
struct Card {
    var companyName: String
    var cardType: String
    var cardNumber: String
    var symbolName: String
    var gradientColors: [Color]
}

// Preview Provider
struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView(selectedTab: .constant(0))
    }
}
