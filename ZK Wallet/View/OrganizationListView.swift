//
//  OrganizationListView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct OrganizationListView: View {
    var state: StateModel
    let organizations: [OrganizationModel]
    @State private var selectedOrganization: OrganizationModel?
    @State private var showLoginView: Bool = false

    var body: some View {
        List(organizations) { organization in
            Button(action: {
                print("Organization selected: \(organization.name)")
                self.selectedOrganization = organization
                self.showLoginView = true
            }) {
                HStack {
                    Image(systemName: "building.2.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                        .padding(.trailing, 10)

                    Text(organization.name)
                }
            }
        }
        .navigationTitle("Orgs. in \(state.stateName)")
        .sheet(isPresented: $showLoginView) {
            if let selectedOrg = selectedOrganization {
//                print("Presenting LoginView for \(selectedOrg.name)")
                NavigationView {
                    LoginView(organization: selectedOrg)
                }
            } else {
                Text("No organization selected").padding()
            }
        }
    }
}



#Preview {
    OrganizationListView(
        state: StateModel(id: 1, stateName: "Sample State", stateCode: "SS", countryName: "Country"),
        organizations: [
            OrganizationModel(id: 1, name: "Registry Of Motor Vehicles"),
            OrganizationModel(id: 2, name: "Social Security Administration"),
            OrganizationModel(id: 3, name: "Dept. of Homeland Security")
        ]
    )
}



