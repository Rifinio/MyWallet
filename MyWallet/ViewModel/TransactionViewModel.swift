//
//  TransactionViewModel.swift
//  MyWallet
//
//  Created by Adil Bougamza on 15/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import Foundation

class TransactionViewModel {
    var transaction: Transaction
    var user: User

    init(transaction: Transaction, user: User) {
        self.transaction = transaction
        self.user = user
    }
    
    func balanceBefore() -> Float {
        if let balances = calculateBalance() {
            return balances.0
        }
        
        return 0
    }
    
    func balanceAfter() -> Float {
        if let balances = calculateBalance() {
            return balances.1
        }

        return 0
    }
    
    /// this function will calculate the balance before and after of each transaction only once and has a complexity O(n)
    private func calculateBalance() -> (Float, Float)?  {
        guard let transactions = user.account.transactions else { return nil }
        if let balanceBefore = transaction.balanceBefore,
            let balanceAfter = transaction.balanceAfter {
            return (balanceBefore, balanceAfter)
        }
        
        var balanceBef: Float = user.account.balance
        var balanceAft: Float = 0
        for t in transactions {
            balanceAft = balanceBef
            balanceBef += -t.amount
            if t == transaction {
                break
            }
        }
        
        transaction.balanceBefore = balanceBef
        transaction.balanceBefore = balanceAft
        
        return (balanceBef, balanceAft)
    }
}
