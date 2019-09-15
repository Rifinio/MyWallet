//
//  DataStore.swift
//  MyWallet
//
//  Created by Adil Bougamza on 15/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import Foundation

protocol DataStoreProtocol {
    func loadAccount() -> Account?
}

class DataStore: DataStoreProtocol {
    func loadAccount() -> Account? {
        if let path = Bundle.main.path(forResource: "transactions", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                if let account = try? decoder.decode(Account.self, from: data) {
                    return account
                } else {
                    return nil
                }
            } catch { return nil }
        }
        
        return nil
    }
}
