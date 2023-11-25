//
//  LoginView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct LoginView: View {
    var organization: OrganizationModel
    @State private var phoneNumber: String = ""
    @State private var showOTPView: Bool = false
    @Environment(\.presentationMode) var presentationMode // Used for dismissing the view

    var body: some View {
        VStack {
            // Close button
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Dismiss the view
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .foregroundColor(.red)
                }
            }
            .padding([.top, .trailing])

            // Company logo and other content
            Image(systemName: "building.2.fill") // Replace with the company's logo
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.bottom, 20)

            Text(organization.name)
                .font(.title)
                .padding(.bottom, 20)

            TextField("Enter phone number", text: $phoneNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Get OTP") {
                showOTPView = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            NavigationLink(destination: OTPView(), isActive: $showOTPView) {
                EmptyView()
            }
        }
        .padding()
        .navigationTitle("Login")
    }
}


#Preview {
    LoginView(organization: OrganizationModel(id: 1, name: "Registry Of Motor Vehicles"))
}
