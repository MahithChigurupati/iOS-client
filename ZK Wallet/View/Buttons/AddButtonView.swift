//
//  AddButtonView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 12/6/23.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        Button(action: {
            AppTabView().selectedTab = 1
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
}

#Preview {
    AddButtonView()
}
