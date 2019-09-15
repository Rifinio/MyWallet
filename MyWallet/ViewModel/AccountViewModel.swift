//
//  AccountViewModel.swift
//  MyWallet
//
//  Created by Adil Bougamza on 15/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import Foundation

class AccountViewModel {
    var dataStore: DataStore!
    var user: User?
    
    init(dataStore: DataStore) {
        self.dataStore = dataStore
        reloadData()
    }

    func reloadData() {
        let account = dataStore.loadAccount()
        if let account = account {
            user = User(fullName: "A.BOUGAMZA", account: account)
        }
    }
    
    func numberOfTransactions() -> Int {
        return user?.account.transactions?.count ?? 0
    }
    
    func transationAt(index: Int) -> Transaction? {
        guard let user = user,
            let transactions = user.account.transactions,
            index >= 0,
            index < transactions.count else { return nil }
        return transactions[index]
    }
    
    func iconNameFor(transaction: Transaction) -> String {
        if transaction.amount < 0 {
            return "outcoming"
        } else {
            return "incoming"
        }
    }
}
