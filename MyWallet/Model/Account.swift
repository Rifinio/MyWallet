//
//  Account.swift
//  MyWallet
//
//  Created by Adil Bougamza on 15/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import Foundation

enum AccountType {
    case checkingAccount
    case savingsAccount
    case moneyMarketAccount
}

struct Account : Codable {
    let type: AccountType = .checkingAccount // it should come defined in the Account Json. (for simplicity) 
    let account: String
    let balance: Float
    let transactions: [Transaction]?
    
    enum CodingKeys: String, CodingKey {
        case account
        case balance
        case transactions
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container (keyedBy: CodingKeys.self)
        account = try container.decode(String.self, forKey: .account)
        balance = try Float(container.decode(String.self, forKey: .balance))!
        let trx = try container.decode([Transaction].self, forKey: .transactions)
        transactions = trx.sorted()
    }
    
    func logTransactions() {
        print(self.account)
        print(self.balance)
        guard let transactions = transactions else {return}
        for t in transactions {
            t.log()
            print("--------------------------")
        }
    }
}
