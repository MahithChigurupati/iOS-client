//
//  ContentView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "wallet.pass.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("ZK Wallet")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
