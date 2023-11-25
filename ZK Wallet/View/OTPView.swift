//
//  OTPView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

import SwiftUI

struct OTPView: View {
    @State private var otpDigits = Array(repeating: "", count: 4)
    @State private var timeRemaining = 30
    @State private var isOTPVerified = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 20) {
            if isOTPVerified {
                otpSuccessView
            } else {
                otpEntryView
            }
        }
        .padding()
        .navigationTitle("Verify OTP")
    }

    var otpEntryView: some View {
        VStack(spacing: 20) {
            HStack(spacing: 10) {
                // OTP text fields
                ForEach(0..<4, id: \.self) { index in
                    TextField("", text: $otpDigits[index])
                        .frame(width: 45, height: 45)
                        .textFieldStyle(PlainTextFieldStyle())
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.blue, lineWidth: 1))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                }
            }

            Button("Verify OTP") {
                // Add logic to verify OTP
                isOTPVerified = true // Set to true for testing; replace with actual verification logic
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            resendOTPView
        }
    }

    var otpSuccessView: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)
            
            Text("Card added to wallet")
                .font(.title)
                .foregroundColor(.green)
            
            NavigationLink("Go to Wallet", destination: WalletView(selectedTab: .constant(0))) // Replace with actual WalletView
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }

    var resendOTPView: some View {
        Group {
            if timeRemaining > 0 {
                Text("Resend OTP in \(timeRemaining)s")
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        }
                    }
            } else {
                Button("Resend OTP") {
                    // Logic to resend OTP
                    timeRemaining = 30 // Reset timer
                }
            }
        }
    }
}




#Preview {
    OTPView()
}
