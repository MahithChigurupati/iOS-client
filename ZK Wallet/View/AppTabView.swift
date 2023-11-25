//
//  AppTabView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct AppTabView: View {
    @State private var selectedTab = 0 // Default to the first tab

    var body: some View {
        TabView(selection: $selectedTab) {
            WalletView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Wallet", systemImage: "creditcard.fill")
                }
                .tag(0) // Tag for the first tab
            
            AddCardView()
                .tabItem {
                    Label("Import ID", systemImage: "note.text.badge.plus")
                }
                .tag(1) // Tag for the second tab
            
            HistoryListView()
                .tabItem {
                    Label("History", systemImage: "note.text")
                }
                .tag(2) // Tag for the third tab
        }
        .accentColor(.primary)
    }
}

#Preview {
    AppTabView()
}
