//
//  NoCardsView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 12/6/23.
//

import SwiftUI

struct NoCardsView: View {
    var body: some View {
        VStack {
            Text("No Cards Added")
                .font(.headline)
                .padding(.bottom, 20)
            AddButtonView()
        }
    }
}

#Preview {
    NoCardsView()
}
