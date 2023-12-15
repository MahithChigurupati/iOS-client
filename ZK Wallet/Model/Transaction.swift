//
//  Transaction.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 12/7/23.
//

import Foundation

struct Transaction: Hashable {
    let txId: String
    let from: String
    let message: String
    let timestamp: String?
    let txType: String?
}


