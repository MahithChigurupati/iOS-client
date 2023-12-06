//
//  OTPView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct OTPView: View {
    var phoneNumber: String
    @State private var otpCode = ""
    @State private var timeRemaining = 30
    @State private var isOTPVerified = false
    @State private var isRequestInProgress = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 20) {
            if isOTPVerified {
                OtpSuccessView()
            } else {
                OtpEntryView(otpCode: $otpCode, isRequestInProgress: $isRequestInProgress, verifyOTP: verifyOTP)
            }

            if isRequestInProgress {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .padding()
        .navigationTitle("Verify OTP")
        .onReceive(timer) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }

    func verifyOTP() {
            APIManager.shared.verifyOTP(phoneNumber: phoneNumber, otpCode: otpCode) { success, error in
                isRequestInProgress = false
                if let error = error {
                    // Handle error
                    print("Error: \(error.localizedDescription)")
                } else if success {
                    // Handle success
                    isOTPVerified = true
                }
            }
        }
    
}

#Preview {
    OTPView(phoneNumber: "1234567890")
}
