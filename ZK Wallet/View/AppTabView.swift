//
//  AppTabView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView{
            WalletView()
                .tabItem {
                    Label("Wallet", systemImage: "creditcard.fill")
                }
            
            AddCardView()
                .tabItem {
                    Label("Import ID", systemImage: "note.text.badge.plus")
                }
            
            NavigationView{
                HistoryView()
                    
            }
            .tabItem {
                Label("History", systemImage: "note.text")
            }
        }
        .accentColor(.primary)
    }
}

#Preview {
    AppTabView()
}
