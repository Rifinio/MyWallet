//
//  Account.swift
//  MyWallet
//
//  Created by Adil Bougamza on 15/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import Foundation

struct Account : Codable {
    let account: String
    let balance: Float
    let transactions: [Transaction]?
    
    enum CodingKeys: String, CodingKey {
        case account = "account"
        case balance = "balance"
        case transactions = "transactions"
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container (keyedBy: CodingKeys.self)
        account = try container.decode(String.self, forKey: .account)
        balance = try Float(container.decode(String.self, forKey: .balance))!
        let trx = try container.decode([Transaction].self, forKey: .transactions)
        transactions = trx.sorted()
    }
    
    func logTransactions() {
        guard let transactions = transactions else {return}
        for t in transactions {
            t.log()
            print("--------------------------")
        }
    }
}
