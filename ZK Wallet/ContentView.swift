//
//  ContentView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: Double = 0
    @State private var isLoadingComplete = false

    var body: some View {
        if isLoadingComplete {
            AppTabView()
        } else {
            VStack {
                Spacer()
                
                Image(systemName: "wallet.pass.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("ZK Wallet")
                Spacer()
                
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle())
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .onAppear {
                // First phase: Move to half in 1 second
                withAnimation(.linear(duration: 1)) {
                    progress = 0.5
                }
                
                // Second phase: Wait for 1 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    // No change in progress, just wait
                }
                
                // Third phase: Move to end in the last 1 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.linear(duration: 1)) {
                        progress = 1.0
                    }
                }

                // Finally, after 2 seconds, change the view
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoadingComplete = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

