//
//  Utilities.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 12/6/23.
//

import Foundation

func isValidPhoneNumber(_ number: String) -> Bool {
    return !number.isEmpty && number.count == 10 && number.allSatisfy { $0.isNumber }
}
