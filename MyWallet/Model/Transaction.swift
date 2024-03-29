//
//  Transaction.swift
//  MyWallet
//
//  Created by Adil Bougamza on 15/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import Foundation

struct Transaction: Codable {
    let id: String
    let amount: Float
    let description: String
    let otherAccount: String
    let date: Date
    
    var balanceBefore: Float?
    var balanceAfter: Float?
    
    func log() {
        print(id)
        print(amount)
        print(description)
        print(otherAccount)
        print(date)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case amount
        case description
        case otherAccount
        case date
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container (keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        amount = try Float(container.decode(String.self, forKey: .amount))!
        description = try container.decode(String.self, forKey: .description)
        otherAccount = try container.decode(String.self, forKey: .otherAccount)

        let str = try container.decode(String.self, forKey: .date)
        date = DateFormatterUtil.stringToDate(dateStr: str)!
    }
}

extension Transaction: Comparable, Equatable {
    static func < (lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.date < rhs.date
    }
    
    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.id == rhs.id
    }
}
