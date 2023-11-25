////
////  TestView.swift
////  ZK Wallet
////
////  Created by Mahith ‎ on 11/24/23.
////
//
//import SwiftUI
//
////struct Card: Identifiable {
////    let id = UUID()
////    let title: String
////    let transactions: [String]
////}
//
//struct TestView: View {
//    @State private var cards = [
////        Card(title: "Card 1", transactions: ["Transaction 1", "Transaction 2"]),
////        Card(title: "Card 2", transactions: ["Transaction 3", "Transaction 4"]),
//        // Add more cards as needed
//    ]
//
//    @State private var expandedCard: Card?
//
//    var body: some View {
//        ZStack {
//            ForEach(cards) { card in
//                CardView(card: card)
//                    .offset(y: expandedCard == card ? 0 : 50)
//                    .gesture(
//                        DragGesture()
//                            .onChanged { value in
//                                if value.translation.height > 0 {
//                                    expandedCard = card
//                                }
//                            }
//                            .onEnded { value in
//                                if value.translation.height < 0 {
//                                    expandedCard = nil
//                                }
//                            }
//                    )
//                    .onTapGesture {
//                        if expandedCard == card {
//                            // Navigate to transaction list for the selected card
//                            // You may use NavigationLink or another navigation approach here
//                            print("Navigate to transactions for \(card.title)")
//                        }
//                    }
//            }
//        }
//        .animation(.easeInOut)
//    }
//}
//
//struct CardView: View {
//    let card: Card
//
//    var body: some View {
//        RoundedRectangle(cornerRadius: 16)
//            .fill(Color.blue)
//            .frame(width: 300, height: 150)
//            .overlay(
//                VStack {
//                    Text(card.cardNumber)
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//
//                    if let transactions = card.transactions.first {
//                        Text(transactions)
//                            .foregroundColor(.white)
//                            .padding()
//                    }
//                }
//            )
//            .shadow(radius: 5)
//            .padding()
//            .onTapGesture {
//                // Toggle expanded state
//                // In a more complex scenario, you may want to use a binding
//            }
//    }
//}
//
//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
