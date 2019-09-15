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
}
