//
//  OrganizationModel.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import Foundation

struct OrganizationModel: Decodable, Identifiable {
    var id: Int
    var name: String
    var code: String
    var stateId: Int
}
