//
//  AddCardView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct AddCardView: View {
    @State var stateModels: [StateModel] = StateModel.sampleData
//    @State var stateModels: [StateModel]
    @State var searchTerm = ""
    @State var stateSelected: Bool = false
    @State var selectedStateId: Int = 0
    @State var showModal = false
    @State private var showingAlert = false

    var filteredStates: [StateModel] {
        guard !searchTerm.isEmpty else {
            return stateModels.sorted { $0.stateName.localizedCaseInsensitiveCompare($1.stateName) == .orderedAscending }
        }
        return stateModels.filter { $0.stateName.localizedCaseInsensitiveContains(searchTerm) || $0.stateCode.localizedCaseInsensitiveContains(searchTerm) }
    }

    var body: some View {
        NavigationView {
            VStack {
                NavigationStack {
                    List(self.filteredStates) { model in
                        stateRowView(model)
                    }
                    .listStyle(.plain)
                }
                .searchable(text: $searchTerm, prompt: "Search Your State")
                .navigationTitle("Add a Card")
                .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear(perform: {
                // self.stateModels = DB_Manager().getStates()
            })
        }
    }
    
    func stateRowView(_ model: StateModel) -> some View {
        NavigationLink(destination: OrganizationListView(state: model, organizations: sampleOrganizationsFor(state: model))) {
            HStack {
                Image(systemName: "globe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                    .padding(.trailing, 10)

                Text(model.stateName)
                    .font(.headline)
                    .foregroundColor(.primary)

                Spacer()
            }
            .padding(.vertical, 8)
        }
    }


    // Function to get sample organizations for a state
    func sampleOrganizationsFor(state: StateModel) -> [OrganizationModel] {
        // Return a list of organizations based on the state
        // This is just sample data
        return [
            OrganizationModel(id: 1, name: "Registry Of Motor Vehicles"),
            OrganizationModel(id: 2, name: "Social Security Administration"),
            OrganizationModel(id: 3, name: "Dept. of Homeland Security")
            // Add more organizations as needed
        ]
    }

}

// Preview Provider
struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardView()
    }
}

