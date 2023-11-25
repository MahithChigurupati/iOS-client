//
//  Transaction.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import Foundation

struct Transaction: Hashable {
    let id = UUID()
    var companyName: String
    var date: String
    var amount: String
    var companyImage: String
}
