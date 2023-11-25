//
//  StateModel.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import Foundation

class StateModel: Identifiable {
    public var id: Int
    public var stateName: String
    public var stateCode: String
    public var countryName: String

    init(id: Int, stateName: String, stateCode: String, countryName: String) {
        self.id = id
        self.stateName = stateName
        self.stateCode = stateCode
        self.countryName = countryName
    }
}

extension StateModel {
    static var sampleData: [StateModel] {
        [
            StateModel(id: 1, stateName: "California", stateCode: "CA", countryName: "USA"),
            StateModel(id: 2, stateName: "New York", stateCode: "NY", countryName: "USA"),
            StateModel(id: 3, stateName: "Texas", stateCode: "TX", countryName: "USA"),
            // Add more sample states as needed
        ]
    }
}

